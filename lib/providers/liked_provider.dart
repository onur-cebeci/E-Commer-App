import 'package:e_commer/services/liked_products_service.dart';
import 'package:flutter/material.dart';

class LikedProvider extends ChangeNotifier {
  Icon initialIcon =
      Icon(Icons.favorite_outline_outlined, color: Colors.red.shade500);
  bool iconState = false;

  changeLikedIcon(bool tab, String name, String img, String value,
      String number, String email) {
    if (iconState == false) {
      iconState = tab;
      initialIcon = Icon(Icons.favorite, color: Colors.red.shade500);
      updateLiked(
          email: email, name: name, img: img, number: number, value: value);
    } else {
      iconState = tab;
      initialIcon =
          Icon(Icons.favorite_outline_outlined, color: Colors.red.shade500);
      deleteLiked(
        email: 'onurcebeciturgutlu@gmail.com',
      );
    }

    notifyListeners();
  }
}
