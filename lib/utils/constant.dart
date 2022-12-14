import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF908DB8);
const kSecondColor = Color(0xFFEBECF1);
const kLightColor = Color(0xFFD0D2E1);
const kMiddleColor = Color(0xFFA9A9C5);
const MaterialColor kPrimarySwatch = MaterialColor(
  0xFF908DB8,
  <int, Color>{
    50: Color(0xFFEBECF1),
    100: Color(0xFFEBECF1),
    200: Color(0xFFD0D2E1),
    300: Color(0xFFD0D2E1),
    400: Color(0xFFD0D2E1),
    500: Color(0xFFA9A9C5),
    600: Color(0xFFA9A9C5),
    700: Color(0xFFA9A9C5),
    800: Color(0xFF908DB8),
    900: Color(0xFF908DB8),
  },
);

const double smallPadding = 10;
const double mediumPadding = 20;
const double largePadding = 30;
const double bigPadding = 40;

final id = FirebaseAuth.instance.currentUser?.uid;
