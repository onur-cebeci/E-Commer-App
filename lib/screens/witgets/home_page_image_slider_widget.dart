import 'dart:async';

import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class HomePageImageSlider extends StatefulWidget {
  const HomePageImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageImageSlider> createState() => _HomePageImageSliderState();
}

@override
class _HomePageImageSliderState extends State<HomePageImageSlider> {
  final PageController _controller = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (_controller.page == 0) {
        _controller.jumpToPage(1);
      } else if (_controller.page == 1) {
        _controller.jumpToPage(2);
      } else {
        _controller.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 3.5,
      child: PageView(
        controller: _controller,
        physics: const PageScrollPhysics(),
        children: const [
          HomePageImageSliderBodyWidget(
            img: 'assets/images/kıvık.jpg',
            text: '10% Discount',
            subText: 'sofa set',
          ),
          HomePageImageSliderBodyWidget(
            img: 'assets/images/markus.jpg',
            text: 'office equipment ',
            subText: '',
          ),
          HomePageImageSliderBodyWidget(
            img: 'assets/images/lövbacken.jpg',
            text: 'coffe tables',
            subText: '',
          ),
        ],
      ),
    );
  }
}

class HomePageImageSliderBodyWidget extends StatelessWidget {
  const HomePageImageSliderBodyWidget({
    Key? key,
    required this.img,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String img;
  final String text;
  final String subText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.inner),
              ],
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius:
                  const BorderRadius.all(Radius.circular(mediumPadding))),
        ),
        Positioned(
            top: (size.height / 3.5) / 2,
            right: mediumPadding,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white.withOpacity(0.9), fontSize: 40),
            )),
        Positioned(
            bottom: (size.height / 3.5) / 6,
            right: mediumPadding,
            child: Text(
              subText,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white.withOpacity(0.9)),
            )),
      ],
    );
  }
}
