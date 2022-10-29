import 'package:e_commer/constant.dart';
import 'package:e_commer/models/firestore_services/liked_products_model.dart';
import 'package:e_commer/services/liked_products_service.dart';
import 'package:flutter/material.dart';

class LikedProductsHomePage extends StatefulWidget {
  const LikedProductsHomePage({Key? key}) : super(key: key);

  @override
  State<LikedProductsHomePage> createState() => _LikedProductsHomePageState();
}

class _LikedProductsHomePageState extends State<LikedProductsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<LikedProductsModel>>(
        stream: readLikedList(email: email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView(
              children: products.map(productsWidgetBody).toList(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Going Wrong'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget productsWidgetBody(LikedProductsModel products) => Container(
    padding: const EdgeInsets.all(smallPadding),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: kLightColor,
          blurRadius: 2,
          spreadRadius: 0.2,
          blurStyle: BlurStyle.outer,
        ),
      ],
    ),
    height: 130,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
          ),
          height: 110,
          width: 105,
          child: Image.asset(
            products.img,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: mediumPadding),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      products.name,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(products.number),
                    const Spacer(),
                  ],
                ),
              ],
            )),
        const Spacer(),
        SizedBox(
          height: 70,
          width: 120,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add to Basket \n\$${products.value}',
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ));
