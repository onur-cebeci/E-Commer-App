import 'package:e_commer/models/firestore_services/basket_list_model.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class GetBasketListProducts extends StatelessWidget {
  const GetBasketListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<BasketListModel>>(
      stream: readBasketList(email: id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;

          return SizedBox(
            height: size.height / 1.45,
            child: ListView(
              children:
                  products.map((e) => productsWidgetBody(e, context)).toList(),
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
    );
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
