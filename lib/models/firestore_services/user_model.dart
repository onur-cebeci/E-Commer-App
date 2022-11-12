class UserModel {
  final String email;

  UserModel({required this.email});

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
      );
}
