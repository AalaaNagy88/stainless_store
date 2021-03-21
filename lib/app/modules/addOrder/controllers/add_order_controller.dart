
import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/order_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/firebase_services/client_detials_services.dart';

class AddOrderController extends GetxController with OrderControllerMixin {
  final Rx<ClientModel> rxclient;
  ClientModel get client => rxclient.value;
  AddOrderController(this.rxclient);
  RxString selectedColor = RxString();
  RxString selectedType = RxString();
  @override
  void onInit() {
    selectedColor.value = "sliver";
    selectedType.value = "sheets";

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  double calcSheetPrice() {
    return priceValue * amountValue;
  }

  addOrder() {
    client.orders.add(OrderModel(
        type: selectedType.value,
        color: selectedColor.value,
        amount: amountValue,
        price: priceValue,
        size: sizeValue,
        totalPrice:
            selectedType.value == "sheets" ? calcSheetPrice() : priceValue,
        createdAt: DateTime.now()));
    ClientDetialsServices().addOrder(client);
    Get.back();
  }
}
