import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomNavigatorWidgetProvider extends ChangeNotifier {
  late Icon homeIcon = const Icon(
    Icons.home,
    color: kSecondColor,
    size: 30,
  );
  late Icon categoryIcon = const Icon(Icons.category_outlined);
  late Icon basketIcon = const Icon(Icons.shopping_bag_outlined);
  late Icon profileIcon = const Icon(Icons.person_outline);

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

  basketPageIcon(bool selected) {
    bool toggle = false;
    toggle = selected;
    if (toggle == true) {
      basketIcon = const Icon(
        Icons.shopping_bag,
        color: kSecondColor,
        size: 30,
      );
    } else {
      basketIcon = const Icon(Icons.shopping_bag_outlined);
    }
    notifyListeners();
  }

  profilePageIcon(bool selected) {
    bool toggle = false;
    toggle = selected;
    if (toggle == true) {
      profileIcon = const Icon(
        Icons.person,
        color: kSecondColor,
        size: 30,
      );
    } else {
      profileIcon = const Icon(Icons.person_outlined);
    }
    notifyListeners();
  }
}
