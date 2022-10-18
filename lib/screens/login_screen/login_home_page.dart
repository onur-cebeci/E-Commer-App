import 'package:e_commer/screens/login_screen/auth_page.dart';
import 'package:e_commer/screens/login_screen/verify_email.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('wrong'),
            );
          } else if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
