import 'dart:convert';

import 'package:e_commer/models/api_services/products_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class ProductsApi {
  Future<List<Products>> readProdutcsJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('assets/data/products_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Products.fromMap(e)).toList();
  }
}
