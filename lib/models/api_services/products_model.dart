// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

Products productsFromMap(String str) => Products.fromMap(json.decode(str));

String productsToMap(Products data) => json.encode(data.toMap());

class Products {
  Products({
    required this.modelName,
    required this.category,
    required this.productType,
    required this.img,
    required this.value,
    required this.number,
    required this.color,
    required this.productId,
    required this.familyId,
  });

  final String modelName;
  final String category;
  final String productType;
  final String img;
  final String value;
  final String number;
  final String color;
  final int productId;
  final List<String>? familyId;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        modelName: json["model_name"] == null ? null : json["model_name"],
        category: json["category"] == null ? null : json["category"],
        productType: json["product_type"] == null ? null : json["product_type"],
        img: json["img"] == null ? null : json["img"],
        value: json["value"] == null ? null : json["value"],
        number: json["number"] == null ? null : json["number"],
        color: json["color"] == null ? null : json["color"],
        productId: json["product_Id"] == null ? null : json["product_Id"],
        familyId: json["family_ID"] == null
            ? null
            : List<String>.from(json["family_ID"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "model_name": modelName == null ? null : modelName,
        "category": category == null ? null : category,
        "product_type": productType == null ? null : productType,
        "img": img == null ? null : img,
        "value": value == null ? null : value,
        "number": number == null ? null : number,
        "color": color == null ? null : color,
        "product_Id": productId == null ? null : productId,
        "family_ID": familyId == null
            ? null
            : List<dynamic>.from(familyId!.map((x) => x)),
      };
}
