import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/screens/products_details_pages/details_page.dart';
import 'package:e_commer/screens/products_list_pages/products_detail_page_image.dart';
import 'package:e_commer/services/basket_list_service.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductListBodyWidget extends StatelessWidget {
  const ProductListBodyWidget(
      {Key? key, required this.listIndex, required this.index})
      : super(key: key);

  final Products listIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 650),
              pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: DetailsPage(
                    product: listIndex,
                  ),
                );
              }),
        );
      },
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: kLightColor,
              blurRadius: 3,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer)
        ]),
        child: Column(
          children: [
            CustomImageWidget(listIndex: listIndex, index: index),
            const Spacer(),
            Text(
              listIndex.modelName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                listIndex.productType.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    updateBasket(
                        email: id!,
                        name: listIndex.modelName,
                        value: listIndex.value,
                        number: listIndex.number,
                        img: listIndex.img);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kLightColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Add to Basket',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Icon(
                          Icons.shopping_basket_rounded,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "\$",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.green[900]),
                    ),
                    TextSpan(
                      text: listIndex.value.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kPrimaryColor),
                    ),
                  ]),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
