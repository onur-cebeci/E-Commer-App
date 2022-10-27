import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/user_model.dart';

Future createUser({required String email}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(email);

  final user = User(
    id: email,
  );
  final json = user.toJson();
  await docUser.set(json);
}
/*

Future createUser(
    {required List<Products> likedProducts,
    required List<Products> boughtProducts}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  final user = User(
      id: docUser.id,
      likedProducts: likedProducts,
      boughtProducts: boughtProducts);
  final json = user.toJson();
}

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('users')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => User.fromJson(doc.data())).toList());

 */
