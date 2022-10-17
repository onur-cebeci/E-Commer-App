import 'package:e_commer/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> singIn(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  String emailAnswerText = 'email_or_password_false';
  final snackBar = SnackBar(
    content: Text(
      emailAnswerText,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
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
