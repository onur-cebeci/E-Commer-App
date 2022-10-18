import 'package:e_commer/constant.dart';
import 'package:e_commer/firebase_auth/sign_up_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.onClicledSingUp,
  }) : super(key: key);
  final VoidCallback onClicledSingUp;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordControllerAgain = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    const imgSizeHeight = 180.0;
    const imgSizeWidth = 200.0;
    return Scaffold(
        body: Form(
      key: formKey,
      child: Stack(
        children: [
          Stack(
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
                bottom: 0,
                right: -50,
                child: SizedBox(
                  height: imgSizeHeight,
                  width: imgSizeWidth,
                  child: Transform.rotate(
                    angle: 3.14,
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: onClicledSingUp,
                      child: const Text(
                        'Sing In',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Sing Up',
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
              Text('Sing Up Page',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: kMiddleColor,
                      )),
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
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'enter valid email address'
                          : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  validator: (value) => value != null && value.length < 6
                      ? 'must be at least 6 characters'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: TextFormField(
                  controller: passwordControllerAgain,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Retype Password',
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  validator: (_) => passwordController.text.trim() !=
                          passwordControllerAgain.text.trim()
                      ? 'passwords not same'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      singUpWithFirebase(emailController, passwordController,
                          context, formKey);
                    },
                    child: const Text('Sing In'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
