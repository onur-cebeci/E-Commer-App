import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/firestore_services/basket_list_model.dart';

late String documentSnapshotID = '';
Future updateBasket({
  required String email,
  required String name,
  required String value,
  required String img,
  required String number,
}) async {
  final docUSer = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('basketList');

  docUSer.add({
    'name': name,
    'value': value,
    'image': img,
    'number': number,
    'id': '',
  }).then((documentSnapshot) =>
      docUSer.doc(documentSnapshot.id).update({'id': documentSnapshot.id}));

  //docUSer.update({'likedList': likedProducts});
}

Future deleteBasket(
    {required String email, required String documentSnapshotId}) async {
  final docList = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('basketList');

  docList.doc(documentSnapshotId).delete();
}

Stream<List<BasketListModel>> readBasketList({required String email}) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('basketList')
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((doc) => BasketListModel.fromJson(doc.data()))
          .toList());
}
