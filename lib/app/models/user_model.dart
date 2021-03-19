import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({this.store});

  Map<String, dynamic> store;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        store: json["store"],
      );

  Map<String, dynamic> toJson() => {
        "store": store,
      };
}
