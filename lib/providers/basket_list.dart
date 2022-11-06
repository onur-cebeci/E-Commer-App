import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commer/services/total_value_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class BasketProvider extends ChangeNotifier {
  getValue(double value) {
    final userPath = (FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .collection('totalValue')
            .doc('value')
            .get())
        .then((DocumentSnapshot documentSnapshot) {
      final totalValue = documentSnapshot.get('value');
      double result = totalValue + value;
      updateTotalValue(email: email, value: double.parse(result.toString()));
    });

    notifyListeners();
  }

  deleteValue(double value) {
    final userPath = (FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .collection('totalValue')
            .doc('value')
            .get())
        .then((DocumentSnapshot documentSnapshot) {
      final totalValue = documentSnapshot.get('value');
      double result = totalValue - value;
      updateTotalValue(email: email, value: double.parse(result.toString()));
    });

    notifyListeners();
  }
}
