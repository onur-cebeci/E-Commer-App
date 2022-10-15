import 'dart:convert';

List<Products> productsFromMap(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromMap(x)));

String productsToMap(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

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
  final List<int> familyId;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        modelName: json["model_name"],
        category: json["category"],
        productType: json["product_type"],
        img: json["img"],
        value: json["value"],
        number: json["number"],
        color: json["color"],
        productId: json["product_Id"],
        familyId: List<int>.from(json["family_ID"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "model_name": modelName,
        "category": category,
        "product_type": productType,
        "img": img,
        "value": value,
        "number": number,
        "color": color,
        "product_Id": productId,
        "family_ID": List<dynamic>.from(familyId.map((x) => x)),
      };
}
