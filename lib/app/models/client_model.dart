// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';

ClientModel clientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    this.id,
    this.name,
    this.orders,
    this.payments,
    this.ordersPrice,
    this.totalPayed,
    this.remains,
  });

  String id;
  String name;
  List<OrderModel> orders;
  List<PayModel> payments;
  double ordersPrice;
  double totalPayed;
  double remains;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        name: json["name"],
        orders:
            json["orders"] == null ? [] : orderModelFromJson(json["orders"]),
        payments:
            json["payments"] == null ? [] : payModelFromJson(json["payments"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "orders": orders == null ? null : orderModelToJson(orders),
        "payments": payments == null ? null : payModelToJson(payments),
      };
  double calcuateOrderPrice(List<OrderModel> orders) {
    if (orders != []) {
      return orders.fold(
          0, (previousValue, element) => previousValue + element.price);
    } else
      return 0;
  }

  double calcuatePayments(List<PayModel> payements) {
    if (payements != []) {
      return payements.fold(
          0, (previousValue, element) => previousValue + element.payed);
    } else
      return 0;
  }

  double calcuateRemains(List<OrderModel> orders, List<PayModel> payements) =>
      calcuateOrderPrice(orders) - calcuatePayments(payements);
}

extension copy on ClientModel {
  ClientModel calc() {
    this.totalPayed = calcuatePayments(this.payments);
    this.ordersPrice = calcuateOrderPrice(this.orders);
    this.remains = calcuateRemains(this.orders, this.payments);
    return this;
  }
}
