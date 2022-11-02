class BasketListModel {
  late String name;
  late String value;
  late String img;
  late String number;

  BasketListModel(
      {required this.number,
      required this.img,
      required this.value,
      required this.name});

  Map<String, dynamic> toJson() =>
      {'name': name, 'value': value, 'image': img, 'number': number};

  static BasketListModel fromJson(Map<String, dynamic> json) => BasketListModel(
        name: json['name'],
        value: json['value'],
        img: json['image'],
        number: json['number'],
      );
}
