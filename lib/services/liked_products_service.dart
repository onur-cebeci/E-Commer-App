import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/liked_products_model.dart';

late String documentSnapshotID = '';

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

  //docUSer.update({'likedList': likedProducts});
}

Stream<List<LikedProducts>> readLikedList({required String email}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('likedProducts')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => LikedProducts.fromJson(doc.data()))
            .toList());

Future deleteLiked({required String email}) async {
  final docUSer = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('likedProducts');

  docUSer.doc(documentSnapshotID).delete();
}
