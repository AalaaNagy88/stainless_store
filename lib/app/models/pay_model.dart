// To parse this JSON data, do
//
//     final PayModel = PayModelFromJson(jsonString);

import 'dart:convert';

List<PayModel> payModelFromJson(String str) =>
    List<PayModel>.from(json.decode(str).map((x) => PayModel.fromJson(x)));

String payModelToJson(List<PayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PayModel {
  PayModel({this.createdAt, this.payed});

  DateTime createdAt;
  double payed;

  factory PayModel.fromJson(Map<String, dynamic> json) => PayModel(
        createdAt: DateTime.parse(json["createdAt"]),
        payed: json["payed"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "payed": payed,
      };
}
