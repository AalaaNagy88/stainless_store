import 'dart:convert';

StoreModel storeModelFromJson(String str) =>
    StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.sliver,
    this.gold,
  });

  double sliver;
  double gold;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        sliver: json["sliver"],
        gold: json["gold"],
      );

  Map<String, dynamic> toJson() => {
        "sliver": sliver,
        "gold": gold,
      };
}
