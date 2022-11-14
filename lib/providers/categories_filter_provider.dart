import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/models/categories_model.dart';
import 'package:flutter/cupertino.dart';

class CategoriesFilterProvider extends ChangeNotifier {
  late SliverGridDelegate sliverGridDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.6,
  );
  late List<Products> categoryProductsList = <Products>[];

  filterGridView(
      {required Categories categoryItem,
      required List<Products> productsList}) {
    productsList.forEach((element) {
      if (categoryItem.categoryName == element.category) {
        categoryProductsList.add(element);
        print(categoryProductsList.toString());
      }
    });
  }
}
