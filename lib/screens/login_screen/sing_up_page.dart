import 'package:e_commer/constant.dart';
import 'package:e_commer/screens/login_screen/sing_in_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const imgSizeHeight = 180.0;
    const imgSizeWidth = 200.0;
    return Scaffold(
      body: Stack(
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
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 650),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: const SignIn(),
                                );
                              }),
                        );
                      },
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Retype Password',
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding, vertical: smallPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Image.asset('assets/icons/google.png'),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kLightColor),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sing In'),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      child: Image.asset('assets/icons/facebook.png'),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kLightColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
