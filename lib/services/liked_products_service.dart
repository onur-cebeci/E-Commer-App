import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/firestore_services/liked_products_model.dart';

late String documentSnapshotID = '';

Stream<List<LikedProductsModel>> readLikedList({required String email}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('likedProducts')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => LikedProductsModel.fromJson(doc.data()))
            .toList());

Future updateLiked({
  required String email,
  required String name,
  required String value,
  required String img,
  required String number,
}) async {
  final docUSer = FirebaseFirestore.instance.collection('users').doc(email);

  docUSer
      .collection('likedProducts')
      .add({'name': name, 'value': value, 'image': img, 'number': number}).then(
          (documentSnapshot) => documentSnapshotID = documentSnapshot.id);
}

Future deleteLiked({required String email}) async {
  final docList = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('likedProducts');

  docList.doc(documentSnapshotID).delete();
}
