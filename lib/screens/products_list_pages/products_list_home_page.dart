import 'package:e_commer/data/products_data.dart';
import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/screens/products_list_pages/products_list_detail_body.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductsListHomePageWidget extends StatelessWidget {
  const ProductsListHomePageWidget({Key? key}) : super(key: key);

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
              child: Text(
                "Something Going Wrong",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red),
              ),
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
                    index: index,
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
