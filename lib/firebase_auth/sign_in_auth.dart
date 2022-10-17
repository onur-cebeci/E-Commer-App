import 'package:e_commer/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> singInWithFirebase(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  String emailAnswerText = 'Email or Password false!!';
  final snackBar = SnackBar(
    content: Text(
      emailAnswerText,
      style: Theme.of(context).textTheme.headline4,
    ),
    backgroundColor: kPrimaryColor,
  );
  try {
    await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
