class TotalValueModel {
  late String id;
  late double value;

  TotalValueModel({
    required this.value,
    required this.id,
  });

  Map<String, dynamic> toJson() => {'value': value, 'id': id};

  static TotalValueModel fromJson(Map<String, dynamic> json) => TotalValueModel(
        value: json['value'],
        id: json['id'],
      );
}
