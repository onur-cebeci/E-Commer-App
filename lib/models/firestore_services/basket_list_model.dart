class BasketListModel {
  late String name;
  late String value;
  late String img;
  late String number;
  late String id;

  BasketListModel(
      {required this.number,
      required this.img,
      required this.value,
      required this.name,
      required this.id});

  Map<String, dynamic> toJson() =>
      {'name': name, 'value': value, 'image': img, 'number': number, 'id': id};

  static BasketListModel fromJson(Map<String, dynamic> json) => BasketListModel(
        name: json['name'],
        value: json['value'],
        img: json['image'],
        number: json['number'],
        id: json['id'],
      );
}
