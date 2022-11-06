import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/models/firestore_services/total_value_model.dart';

Stream<List<TotalValueModel>> readTotalValue({required String email}) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('totalValue')
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((doc) => TotalValueModel.fromJson(doc.data()))
          .toList());
}

Future setTotalValue({required String email, required double value}) async {
  final userValue = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('totalValue')
      .doc('value');
  final totalValue = TotalValueModel(
    id: email,
    value: value,
  );
  final json = totalValue.toJson();
  await userValue.set(json);
}

Future updateTotalValue({required String email, required double value}) async {
  final docList = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('totalValue')
      .doc('value');

  docList.update({'value': value});
}

Future deleteTotalValue({required String email}) async {
  final docList = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('basketList');

  docList.doc('value').delete();
}
