import 'package:e_commer/firebase_auth/reset_password.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mediumPadding),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Write Your Email Address",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(height: mediumPadding),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Please enter valid email address'
                        : null,
              ),
              const SizedBox(height: mediumPadding),
              ElevatedButton.icon(
                onPressed: () {
                  resetPassword(emailController, context);
                },
                icon: const Icon(Icons.email_outlined),
                label: const Text(
                  'Send Link',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
