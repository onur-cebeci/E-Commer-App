import 'dart:async';

import 'package:e_commer/constant.dart';
import 'package:e_commer/models/categories_model.dart';
import 'package:e_commer/screens/home_pages/products_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageViewController =
        PageController(keepPage: true, initialPage: 0);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: CustomNavigationBarWidget(
            size: size, controller: _pageViewController),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.exit_to_app),
          ),
        ),
        body: PageView(
          controller: _pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePageWidgets(),
            ProductsListWidget(),
          ],
        ));
  }
}

class HomePageWidgets extends StatelessWidget {
  const HomePageWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const CategoriesMenuWidget(),
        const HomePageImageSlider(),
        Container(
          padding: EdgeInsets.only(top: mediumPadding, left: 5, right: 5),
          height: size.height / 3.1,
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Populer Products',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {},
                      child: Text(
                        'see all',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: kPrimaryColor, fontSize: 11),
                      ))
                ],
              ),
              Container(
                height: (size.height / 3.1) / 1.5,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomNavigationBarWidget extends StatelessWidget {
  const CustomNavigationBarWidget({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 12,
      decoration: const BoxDecoration(
          color: kLightColor,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor,
                blurRadius: 4,
                spreadRadius: 1.2,
                blurStyle: BlurStyle.solid)
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              controller.jumpToPage(0);
            },
            child: const Icon(Icons.home),
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(1);
            },
            child: const Icon(Icons.category_outlined),
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(2);
            },
            child: const Icon(Icons.favorite),
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(3);
            },
            child: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
    );
  }
}

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
        /*
        _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad);
       */
        _controller.jumpToPage(1);
      } else if (_controller.page == 1) {
        _controller.jumpToPage(2);
        /*
           _controller.animateToPage(_controller.page!.toInt() - 2,
            duration: const Duration(milliseconds: 10),
            curve: Curves.easeInQuad);
         */

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

class CategoriesMenuWidget extends StatelessWidget {
  const CategoriesMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 5,
          child: GridView.builder(
              padding: const EdgeInsets.only(top: mediumPadding),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 70,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 50,
                  mainAxisSpacing: 10),
              itemCount: categoryList.length,
              itemBuilder: (_, index) {
                final itemIndex = categoryList[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: kSecondColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(itemIndex.icon),
                        const Spacer(),
                        Text(
                          itemIndex.categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
