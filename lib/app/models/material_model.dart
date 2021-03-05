//import 'dart:convert';

// List<MaterialModel> materialModelFromJson(String str) =>
//     List<MaterialModel>.from(
//         json.decode(str).map((x) => MaterialModel.fromJson(x)));

// String materialModelToJson(List<MaterialModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//Todo:check how to manage data from firebase
class MaterialModel {
  MaterialModel({
    this.createdAt,
    this.type,
    this.number,
    this.size,
    this.price,
    this.totalPrice,
  });

  DateTime createdAt;
  String type;
  double number;
  double size;
  double price;
  double totalPrice;

  // factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
  //       createdAt: DateTime.parse(json["createdAt"]),
  //       number: json["number"],
  //       price: json["price"],
  //       totalPrice: json["totalPrice"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "createdAt": createdAt.toIso8601String(),
  //       "number": number,
  //       "price": price,
  //       "totalPrice": totalPrice,
  //     };
}
