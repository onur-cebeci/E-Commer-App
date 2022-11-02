import 'package:e_commer/services/users_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future singUpWithFirebase(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    GlobalKey<FormState> formKey) async {
  String emailAnswerText = 'This account already exists';
  final snackBar = SnackBar(
    content: Text(
      emailAnswerText,
      style: Theme.of(context).textTheme.headline4,
    ),
    backgroundColor: kPrimaryColor,
  );
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    await createUser(
      email: emailController.text.trim(),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
