import 'package:e_commer/constant.dart';
import 'package:e_commer/models/firestore_services/basket_list_model.dart';
import 'package:e_commer/providers/basket_list.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketListHomePage extends StatefulWidget {
  const BasketListHomePage({Key? key}) : super(key: key);

  @override
  State<BasketListHomePage> createState() => _BasketListHomePageState();
}

class _BasketListHomePageState extends State<BasketListHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<BasketListModel>>(
        stream: readBasketList(email: email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;

            final productsName = products.map((e) =>
                Provider.of<BasketProvider>(context, listen: true)
                    .addNameList(e.name.toString()));
            print(productsName);
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

Widget productsWidgetBody(BasketListModel products) => Container(
    padding: const EdgeInsets.all(smallPadding),
    decoration: const BoxDecoration(
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
