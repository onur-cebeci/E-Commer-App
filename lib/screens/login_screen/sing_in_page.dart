import 'package:e_commer/constant.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const imgSizeHeight = 200.0;
    const imgSizeWidth = 250.0;
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
                    height: 180,
                    width: 200,
                    child: Image.asset("assets/images/login/main_top.png"),
                  )),
              Positioned(
                top: -bigPadding,
                right: -bigPadding,
                child: SizedBox(
                  height: 180,
                  width: 200,
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
              Positioned(
                top: size.height / 12,
                child: RichText(
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
              ),
              Positioned(
                top: size.height / 8,
                child: Text('App',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: kMiddleColor,
                        )),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(mediumPadding),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(mediumPadding),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hoverColor: kPrimaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(mediumPadding),
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
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sing In'),
                      ),
                    ),
                    Spacer(),
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
/*
            Positioned(
                top: size.height / 6,
                child: Padding(
                  padding: const EdgeInsets.all(mediumPadding),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hoverColor: kPrimaryColor,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                )),
            Positioned(
                top: size.height / 5,
                child: Padding(
                  padding: const EdgeInsets.all(mediumPadding),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hoverColor: kPrimaryColor,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                )),
            Positioned(
                top: size.height / 6,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sing In'),
                  ),
                )),
 */
