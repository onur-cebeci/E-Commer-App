import 'package:e_commer/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future singUp(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    GlobalKey<FormState> formKey) async {
  String emailAnswerText = 'already_exists';
  final snackBar = SnackBar(
    content: Text(
      emailAnswerText,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    backgroundColor: kPrimaryColor,
  );
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
