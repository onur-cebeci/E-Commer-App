import 'package:e_commer/constant.dart';
import 'package:e_commer/models/categories_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        body: Column(
          children: [
            const CategoriesMenuWidget(),
            Container(
              height: size.height / 3.5,
              color: Colors.yellow,
            ),
          ],
        ));
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
                  maxCrossAxisExtent: 60,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
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
