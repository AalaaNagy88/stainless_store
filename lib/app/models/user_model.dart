import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({this.store, this.isDarkMode, this.userLanguage});

  Map<String, dynamic> store;
  bool isDarkMode;
  String userLanguage;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        store: json["store"],
        isDarkMode: json["isDarkMode"],
        userLanguage: json["userLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "store": store,
        "isDarkMode": isDarkMode,
        "userLanguage": userLanguage,
      };
}
