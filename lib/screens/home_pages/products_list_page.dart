import 'package:e_commer/constant.dart';
import 'package:e_commer/data/products_data.dart';
import 'package:e_commer/models/products_model.dart';
import 'package:e_commer/screens/products_details_pages/details_page.dart';
import 'package:flutter/material.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(top: smallPadding),
      child: FutureBuilder(
        future: ProductsApi().readProdutcsJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var productsList = data.data as List<Products>;
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: smallPadding),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 10),
                itemCount: productsList.length,
                itemBuilder: (_, index) {
                  final listIndex = productsList[index];
                  return ProductListBodyWidget(
                    listIndex: listIndex,
                  );
                });
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

class ProductListBodyWidget extends StatelessWidget {
  const ProductListBodyWidget({Key? key, required this.listIndex})
      : super(key: key);

  final Products listIndex;
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
            CustomImageWidget(listIndex: listIndex),
            const Spacer(),
            Text(
              listIndex.modelName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
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
                Container(
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
                        padding: EdgeInsets.symmetric(horizontal: 5),
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

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

  final Products listIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(listIndex.img![0]),
            ),
          ),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.favorite,
                color: Colors.red[500],
              ),
            )),
      ],
    );
  }
}
