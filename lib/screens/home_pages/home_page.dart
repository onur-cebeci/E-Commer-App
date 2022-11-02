import 'package:e_commer/screens/basket_list_pages/basket_list_home_page.dart';
import 'package:e_commer/screens/home_pages/home_screen.dart';
import 'package:e_commer/screens/products_list_pages/products_list_home_page.dart';
import 'package:e_commer/screens/witgets/custom_navigator_bar_widget.dart';
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
          controller: _pageViewController,
          size: size,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
              },
              child: const Icon(Icons.exit_to_app),
            ),
            const SizedBox(
              width: 5,
            )
          ],
          title: Text(
            'E-Commerce',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              height: size.height - 130,
              child: PageView(
                controller: _pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  HomeScreen(),
                  ProductsListHomePageWidget(),
                  BasketListHomePage(),
                ],
              ),
            )));
  }
}
