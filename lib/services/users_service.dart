import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/firestore_services/user_model.dart';

Future createUser({required String email}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(email);
  final user = User(
    id: email,
    likedProducts: [''],
    basketList: [''],
  );
  final json = user.toJson();
  await docUser.set(json);
}
