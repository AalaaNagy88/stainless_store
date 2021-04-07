import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:stainless_v2/app/controllers_mixins/selectable_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:intl/intl.dart';

class ClientDetialsController extends GetxController
    with SelectableControllerMixin, SingleGetTickerProviderMixin {
  final ClientModel client;
  ClientDetialsController(this.client);
  List<OrderModel> get orders => client.orders;
  List<PayModel> get payments => client.payments;
  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      deselectAll();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
  }

  share() {
    tabController.index == 0 ? shareOrders() : sharePayments();
  }

  shareOrders() {
    List<OrderModel> selectedOrders = [];
    for (var i = 0; i < selectedIndexes.length; i++) {
      selectedOrders.add(orders[selectedIndexes[i]]);
    }
    String text = "";
    selectedOrders.forEach((element) {
      text += DateFormat.yMEd(Get.deviceLocale.languageCode +
                  "_" +
                  Get.deviceLocale.countryCode)
              .format(element.createdAt)
              .toString() +
          "\n";
      text +=
          "${S.current.type} : ${element.type == "sheets" ? S.current.sheets : S.current.ouds}\n";
      text +=
          "${S.current.color} : ${element.color == "sliver" ? S.current.sliver : S.current.golden}\n";
      text += "${S.current.amount} : ${element.amount}\n";
      text += "${S.current.size} : ${element.size}\n";
      text += "${S.current.price} : ${element.price}\n";
      text += "=" * 25 + "\n";
      text += "${S.current.totalPrice} : ${element.totalPrice}\n\n";
    });
    text +=
        "${S.current.total} : ${selectedOrders.fold(0, (previousValue, element) => element.totalPrice + previousValue)}\n\n";

    Share.share(text);
  }

  sharePayments() {
    List<PayModel> selectedOrders = [];
    for (var i = 0; i < selectedIndexes.length; i++) {
      selectedOrders.add(payments[selectedIndexes[i]]);
    }
    String text = "";
    selectedOrders.forEach((element) {
      text += DateFormat.yMEd(Get.deviceLocale.languageCode +
                  "_" +
                  Get.deviceLocale.countryCode)
              .format(element.createdAt)
              .toString() +
          "\n";
      text += "${S.current.payed} : ${element.payed}\n\n";
    });
    text += "${S.current.totalPrice} : ${client.ordersPrice}\n";
    text += "${S.current.payed} : ${client.totalPayed}\n";
    text += "${S.current.remains} : ${client.remains}\n";

    Share.share(text);
  }

  Future<bool> onWillPop() async {
    if (selectedIndexes.length != 0) {
      deselectAll();
      return false;
    } else
      return true;
  }
}
