import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/order_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/firebase_services/client_orders_services.dart';

class AddOrderController extends GetxController with OrderControllerMixin {
  final ClientModel client;
  AddOrderController(this.client);
  @override
  void onInit() {
    selectedColor.value = "sliver";
    selectedType.value = "sheets";
    date.value = DateTime.now();
    super.onInit();
  }

  addOrder() async {
    try {
      client.orders.add(OrderModel(
          type: selectedType.value,
          color: selectedColor.value,
          amount: amountValue,
          price: priceValue,
          size: sizeValue,
          totalPrice:
              selectedType.value == "sheets" ? calcSheetPrice() : priceValue,
          createdAt: date.value));

      ClientOrdersServices().addOrder(client);
      Get..back()..back();
    } catch (e) {
      Get.snackbar(e.message, "");
    }
  }
}
