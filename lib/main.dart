import 'package:e_commer/firebase_options.dart';
import 'package:e_commer/providers/bottom_navigator_widget_provider.dart';
import 'package:e_commer/providers/categories_filter_provider.dart';
import 'package:e_commer/screens/login_screens/login_home_page.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigatorWidgetProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesFilterProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
          headline5: TextStyle(
            color: kSecondColor,
            fontSize: 14,
          ),
        ),
      ),
      home: const LoginHomePage(),
    );
  }
}
