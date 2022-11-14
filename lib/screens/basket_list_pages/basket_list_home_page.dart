import 'package:e_commer/screens/basket_list_pages/current_total_value.dart';
import 'package:e_commer/screens/basket_list_pages/get_basket_list_Products.dart';
import 'package:flutter/material.dart';

class BasketListHomePage extends StatelessWidget {
  const BasketListHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        GetBasketListProducts(),
        CurrentTotalValue(),
      ],
    ));
  }
}
