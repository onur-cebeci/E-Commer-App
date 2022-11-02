import 'package:e_commer/firebase_auth/sign_in_auth.dart';
import 'package:e_commer/firebase_auth/socials_auth.dart';
import 'package:e_commer/screens/login_screens/reset_password_page.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key, required this.onClickedSignIn}) : super(key: key);
  final VoidCallback onClickedSignIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            const BackgroundDesign(),
            BodyWidget(onClickedSignIn: onClickedSignIn),
          ],
        ),
      ),
    ));
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sing In'),
              ),
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: onClickedSignIn,
                child: const Text(
                  'Sing Up',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: mediumPadding),
        RichText(
            text: TextSpan(
                text: '',
                style: Theme.of(context).textTheme.headline2,
                children: [
              TextSpan(
                  text: 'E',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kPrimaryColor)),
              TextSpan(
                  text: '-',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kLightColor)),
              TextSpan(
                  text: 'Commerce',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kPrimaryColor)),
            ])),
        Text('App',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: kMiddleColor,
                )),
        const SizedBox(height: mediumPadding),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: mediumPadding, vertical: smallPadding),
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: 'E-mail',
                hoverColor: kPrimaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(mediumPadding),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                labelText: 'Password',
                hoverColor: kPrimaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              singInWithFirebase(emailController, passwordController, context);
            },
            child: const Text('Sing In'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: mediumPadding, vertical: largePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                  child: Image.asset('assets/icons/google.png'),
                  onPressed: () {
                    singInGoogle();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kLightColor),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                  child: const Text('Reset Password'),
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 650),
                          pageBuilder: (context, animation, _) {
                            return FadeTransition(
                              opacity: animation,
                              child: const ResetPasswordPage(),
                            );
                          }),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kLightColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imgSizeHeight = 180.0;
    const imgSizeWidth = 200.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            left: -bigPadding,
            top: 0,
            child: SizedBox(
              height: imgSizeHeight,
              width: imgSizeWidth,
              child: Image.asset("assets/images/login/main_top.png"),
            )),
        Positioned(
          top: -bigPadding,
          right: -bigPadding,
          child: SizedBox(
            height: imgSizeHeight,
            width: imgSizeWidth,
            child: Transform.rotate(
              angle: 1.58,
              child: Image.asset("assets/images/login/signup_top.png"),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: -largePadding,
          child: Image.asset("assets/images/login/main_bottom.png"),
        ),
      ],
    );
  }
}
