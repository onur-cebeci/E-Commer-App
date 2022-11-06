import 'package:e_commer/models/firestore_services/basket_list_model.dart';
import 'package:e_commer/models/firestore_services/total_value_model.dart';
import 'package:e_commer/providers/basket_list.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:e_commer/services/total_value_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketListHomePage extends StatefulWidget {
  const BasketListHomePage({Key? key}) : super(key: key);

  @override
  State<BasketListHomePage> createState() => _BasketListHomePageState();
}

class _BasketListHomePageState extends State<BasketListHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        StreamBuilder<List<BasketListModel>>(
          stream: readBasketList(email: email),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!;

              return SizedBox(
                height: size.height / 1.45,
                child: ListView(
                  children: products.map(productsWidgetBody).toList(),
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
        StreamBuilder<List<TotalValueModel>>(
            stream: readTotalValue(email: email),
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                final products = snapshot.data![0].value.toString();
                return Container(
                    height: size.height / 9.5,
                    width: size.width,
                    color: kSecondColor,
                    child: double.parse(products) == 0
                        ? Text(
                            'Empty',
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Row(
                            children: [
                              Spacer(),
                              Text(
                                'Your total basket value',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: kPrimaryColor),
                              ),
                              Text(
                                ' ${products.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Colors.black),
                              ),
                              Spacer(),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'BUY',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                              SizedBox(width: largePadding),
                            ],
                          ));
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something Going Wrong'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    ));
  }
}

Widget productsWidgetBody(BasketListModel products) {
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
            /*

                  Provider.of<BasketProvider>(context, listen: false)
                      .deleteValue(double.parse(products.value));
             */
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
