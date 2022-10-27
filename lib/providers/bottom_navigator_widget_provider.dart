import 'package:e_commer/constant.dart';
import 'package:flutter/material.dart';

class BottomNavigatorWidgetProvider extends ChangeNotifier {
  late Icon homeIcon = const Icon(
    Icons.home,
    color: kSecondColor,
    size: 30,
  );
  late Icon categoryIcon = const Icon(Icons.category_outlined);

  homePageIcon(bool selected) {
    bool toggle = true;
    toggle = selected;
    if (toggle == true) {
      homeIcon = const Icon(
        Icons.home,
        color: kSecondColor,
        size: 30,
      );
    } else {
      homeIcon = const Icon(Icons.home_outlined);
    }
    notifyListeners();
  }

  categoryPageIcon(bool selected) {
    bool toggle = false;
    toggle = selected;
    if (toggle == true) {
      categoryIcon = const Icon(
        Icons.category,
        color: kSecondColor,
        size: 30,
      );
    } else {
      categoryIcon = const Icon(Icons.category_outlined);
    }
    notifyListeners();
  }
}
