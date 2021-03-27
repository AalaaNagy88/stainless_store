import 'package:get/get.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';

class ClientDetialsController extends GetxController {
  final Rx<ClientModel> rxclient;
  ClientModel get client => rxclient.value;
  ClientDetialsController(this.rxclient);
  MultiSelectController multiSelectController = MultiSelectController();
  List<OrderModel> get orders => client.orders;
  List<PayModel> get payments => client.payments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
