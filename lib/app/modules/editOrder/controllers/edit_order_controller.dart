import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/order_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/firebase_services/client_orders_services.dart';

class EditOrderController extends GetxController with OrderControllerMixin {
  final SelectedItemOfCurrentClient indexOfselected;
  EditOrderController(this.indexOfselected);
  ClientOrdersServices _clientDetialsServices = ClientOrdersServices();
  OrderModel get order => indexOfselected.client.orders
      .elementAt(indexOfselected.selectedItemIndex);
  ClientModel get client => indexOfselected.client;
  @override
  void onInit() {
    price.text = order.price.toString();
    amount.text = order.amount.toString();
    size.text = order.size.toString();
    selectedType.value = order.type;
    selectedColor.value = order.color;
    date.value = order.createdAt;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  deleteOrder() {
    _clientDetialsServices.deleteOrder(indexOfselected);
    Get..back()..back();
  }

  addOrder() {
    indexOfselected.client.orders.add(OrderModel(
        type: selectedType.value,
        color: selectedColor.value,
        amount: amountValue,
        price: priceValue,
        size: sizeValue,
        totalPrice:
            selectedType.value == "sheets" ? calcSheetPrice() : priceValue,
        createdAt: date.value));
    _clientDetialsServices.addOrder(indexOfselected.client);
  }

  editOrder() {
    deleteOrder();
    addOrder();
    Get..back()..back()..back();
  }
}
