import 'package:e_commer/models/firestore_services/basket_list_model.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

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
