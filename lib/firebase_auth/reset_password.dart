import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

Future resetPassword(
    TextEditingController emailController, BuildContext context) async {
  String emailAnswerText = 'renewal_link';
  final snackBar = SnackBar(
    backgroundColor: Colors.white70,
    content: Text(
      emailAnswerText,
      style: const TextStyle(
          color: kLightColor, fontSize: 17, fontWeight: FontWeight.w400),
    ),
  );
  String warnText = 'Check your mail';
  final snackBarWarn = SnackBar(
    backgroundColor: Colors.white70,
    content: Text(
      warnText,
      style: const TextStyle(
          color: Colors.black87, fontSize: 19, fontWeight: FontWeight.w500),
    ),
  );

  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).popUntil((route) => route.isFirst);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarWarn);
  }
}
