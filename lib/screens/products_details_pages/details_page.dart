import 'package:e_commer/constant.dart';
import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/screens/home_pages/home_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.product}) : super(key: key);
  final Products product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightColor,
        title: Text(
          'Product',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(product.img), fit: BoxFit.cover)),
            ),
            const SizedBox(height: mediumPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              product.modelName,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.black),
                            ),
                            const Spacer(),
                            Text(
                              '\$${product.value}',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Text(
                          product.productType,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: largePadding),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: mediumPadding),
                        Text(
                          'Color',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        Text(product.color),
                        const SizedBox(height: largePadding),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: mediumPadding),
                        Text(
                          'Number',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        Text(product.number),
                        const SizedBox(height: largePadding),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Familiar Products',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black),
                  ),
                  RandomImageWidget(
                    size: size,
                  ),
                  const SizedBox(
                    height: smallPadding,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
