import 'dart:convert';

import 'package:e_commer/models/products_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class CategoryApi {
  Future<List<Products>> readCategoriesJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('assets/data/products_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Products.fromMap(e)).toList();
  }
}
