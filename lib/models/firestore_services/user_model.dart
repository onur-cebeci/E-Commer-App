class User {
  final String id;
  late List<String> likedProducts;
  late List<String> basketList;

  User(
      {required this.basketList,
      required this.likedProducts,
      required this.id});

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        likedProducts: json['likedProducts'],
        basketList: json['boughtProducts'],
      );
}
