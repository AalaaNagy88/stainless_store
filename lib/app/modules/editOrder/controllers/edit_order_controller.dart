import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:stainless_v2/app/controllers_mixins/order_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/firebase_services/client_orders_services.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:intl/intl.dart';

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
    Get..back()..back()..back();
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

  shareOrder() {
    String text = "";
    text += DateFormat.yMEd(Get.deviceLocale.languageCode +
                "_" +
                Get.deviceLocale.countryCode)
            .format(order.createdAt)
            .toString() +
        "\n";
    text +=
        "${S.current.type} : ${order.type == "sheets" ? S.current.sheets : S.current.ouds}\n";
    text +=
        "${S.current.color} : ${order.color == "sliver" ? S.current.sliver : S.current.golden}\n";
    text += "${S.current.amount} : ${order.amount}\n";
    text += "${S.current.size} : ${order.size}\n";
    text += "${S.current.price} : ${order.price}\n";
    text += "=" * 25 + "\n";
    text += "${S.current.totalPrice} : ${order.totalPrice}\n\n";
    Share.share(text);
  }
}
