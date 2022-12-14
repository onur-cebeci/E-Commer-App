import 'package:e_commer/screens/login_screens/sing_in_page.dart';
import 'package:e_commer/screens/login_screens/sing_up_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? SignIn(onClickedSignIn: toggle)
      : SignUp(onClicledSingUp: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
