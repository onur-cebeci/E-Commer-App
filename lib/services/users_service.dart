import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/firestore_services/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createUser({required String email}) async {
  final authId = FirebaseAuth.instance.currentUser?.uid.toString();
  final docUser = FirebaseFirestore.instance.collection('users').doc(authId);
  final user = UserModel(
    email: email,
  );
  final json = user.toJson();
  await docUser.set(json);
}
