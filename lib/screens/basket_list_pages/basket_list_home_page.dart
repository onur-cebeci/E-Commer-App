import 'package:e_commer/models/firestore_services/basket_list_model.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class BasketListHomePage extends StatefulWidget {
  const BasketListHomePage({Key? key}) : super(key: key);

  @override
  State<BasketListHomePage> createState() => _BasketListHomePageState();
}

class _BasketListHomePageState extends State<BasketListHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        StreamBuilder<List<BasketListModel>>(
          stream: readBasketList(email: id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!;

              return SizedBox(
                height: size.height / 1.45,
                child: ListView(
                  children: products
                      .map((e) => productsWidgetBody(e, context))
                      .toList(),
                ),
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
        const CurrentTotalValue(),
      ],
    ));
  }
}

class CurrentTotalValue extends StatelessWidget {
  const CurrentTotalValue({Key? key}) : super(key: key);

  static double getCartTotalValue(List<BasketListModel> products) {
    double total = 0;
    for (BasketListModel product in products) {
      total += double.parse(product.value);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<BasketListModel>>(
        stream: readBasketList(email: id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return Container(
                height: size.height / 9.5,
                width: size.width,
                color: kSecondColor,
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Your total basket value',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kPrimaryColor),
                    ),
                    Text(
                      ' ${getCartTotalValue(products)}',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'BUY',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                    const SizedBox(width: largePadding),
                  ],
                ));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Going Wrong'),
            );
          } else {
            return const Center();
          }
        });
  }
}

Widget productsWidgetBody(BasketListModel products, BuildContext context) {
  return Column(
    children: [
      Container(
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
                onPressed: () {
                  deleteBasket(email: id!, documentSnapshotId: products.id);
                },
                child: Text(
                  'Delete \nto Basket\n\$${products.value}',
                  style: const TextStyle(fontFamily: "Serif", fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
