import 'package:e_commer/services/basket_list_service.dart';
import 'package:flutter/material.dart';

class BasketProvider extends ChangeNotifier {
  List<String> nameList = [];
  Icon initialIcon =
      Icon(Icons.favorite_outline_outlined, color: Colors.red.shade500);
  bool iconState = false;

  addNameList(String name) {
    nameList.add(name);
  }

  addLikedList(
      String name, String img, String value, String number, String email) {
    if (nameList.any((e) => e.contains(name) == true)) {
      nameList.remove('${name}');
      deleteBasket(
        email: 'onurcebeciturgutlu@gmail.com',
      );

      initialIcon =
          Icon(Icons.favorite_outline_outlined, color: Colors.red.shade500);
    } else {
      updateBasket(
          email: email, name: name, img: img, number: number, value: value);
      initialIcon = Icon(Icons.favorite, color: Colors.red.shade500);
    }

    notifyListeners();
  }
}
