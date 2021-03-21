import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  OrderModel(
      {this.createdAt,
      this.type,
      this.amount,
      this.size,
      this.price,
      this.totalPrice,
      this.color});

  DateTime createdAt;
  String type;
  String color;
  double amount;
  double size;
  double price;
  double totalPrice;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        createdAt: DateTime.parse(json["createdAt"]),
        type: json["type"],
        color: json["color"],
        amount: json["amount"],
        size: json["size"],
        price: json["price"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "type": type,
        "color": color,
        "amount": amount,
        "size": size,
        "price": price,
        "totalPrice": totalPrice,
      };
}
