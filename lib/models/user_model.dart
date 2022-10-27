class User {
  User({required this.id});
  final String id;

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
      );
}
/*
class User {
  User(
      {this.id = '',
      required this.likedProducts,
      required this.boughtProducts});
  late String id;

  final List<Products> likedProducts;
  final List<Products> boughtProducts;

  Map<String, dynamic> toJson() => {
        'id': id,
        'likedProducts': likedProducts,
        'boughtProducts': boughtProducts
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      likedProducts: json['likedProducts'],
      boughtProducts: json['boughtProducts']);
}
 */
