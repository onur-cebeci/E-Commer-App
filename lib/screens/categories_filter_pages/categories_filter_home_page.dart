import 'package:e_commer/data/products_data.dart';
import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/models/categories_model.dart';
import 'package:e_commer/providers/categories_filter_provider.dart';
import 'package:e_commer/screens/products_list_pages/products_list_detail_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesFilterHomePage extends StatefulWidget {
  const CategoriesFilterHomePage({Key? key, required this.categoryItem})
      : super(key: key);
  final Categories categoryItem;
  @override
  State<CategoriesFilterHomePage> createState() =>
      _CategoriesFilterHomePageState();
}

class _CategoriesFilterHomePageState extends State<CategoriesFilterHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesFilterProvider>(context, listen: false)
        .categoryProductsList = [];
  }

  @override
  void dispose() {
    Provider.of<CategoriesFilterProvider>(context, listen: false)
        .categoryProductsList = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProductsList =
        Provider.of<CategoriesFilterProvider>(context, listen: false)
            .categoryProductsList;
    return Scaffold(
      body: FutureBuilder(
        future: ProductsApi().readProdutcsJsonData(),
        builder: (context, data) {
          if (data.hasData) {
            var productsList = data.data as List<Products>;
            Provider.of<CategoriesFilterProvider>(context, listen: false)
                .filterGridView(
                    categoryItem: widget.categoryItem,
                    productsList: productsList);
            return GridView.builder(
                gridDelegate: Provider.of<CategoriesFilterProvider>(context,
                        listen: false)
                    .sliverGridDelegate,
                itemCount: categoryProductsList.length,
                itemBuilder: (_, index) {
                  final listIndex = categoryProductsList[index];

                  return ProductListBodyWidget(
                    index: index,
                    listIndex: listIndex,
                  );
                });
          } else if (data.hasError) {
            return Center(
              child: Text(
                "Searched product not found",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red),
              ),
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
/*
SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: Image.asset(
                                listIndex.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(listIndex.modelName),
                          ],
                        ),
                      )
 */
