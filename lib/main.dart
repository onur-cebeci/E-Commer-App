import 'package:e_commer/constant.dart';
import 'package:e_commer/firebase_options.dart';
import 'package:e_commer/screens/login_screen/login_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: kSecondColor,
              fontSize: 35,
              fontWeight: FontWeight.w700,
              fontFamily: "Serif"),
          headline2: TextStyle(
              color: kSecondColor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: "Serif"),
          headline3: TextStyle(
              color: kSecondColor,
              fontSize: 23,
              fontWeight: FontWeight.w400,
              fontFamily: "Serif"),
          headline4:
              TextStyle(color: kSecondColor, fontSize: 18, fontFamily: "Serif"),
        ),
      ),
      home: const LoginHomePage(),
    );
  }
}
