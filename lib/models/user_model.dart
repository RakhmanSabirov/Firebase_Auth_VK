import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.image,
    required this.id,
    required this.email,
  });

  String? image;
  String email;
  String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    image: json["image"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "email": email,
  };

  UserModel copyWith({
    String? name,
    String? lastName,
    String? city,
    String? address,
    String? phone,
    image,
  }) =>
      UserModel(
        id: id,
        email: email,
        image: image ?? this.image,
      );
}