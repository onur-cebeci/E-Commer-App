class LikedProducts {
  late String name;
  late String value;
  late String img;
  late String number;

  LikedProducts(
      {required this.number,
      required this.img,
      required this.value,
      required this.name});

  Map<String, dynamic> toJson() =>
      {'name': name, 'value': value, 'image': img, 'number': number};

  static LikedProducts fromJson(Map<String, dynamic> json) => LikedProducts(
        name: json['name'],
        value: json['value'],
        img: json['image'],
        number: json['number'],
      );
}
