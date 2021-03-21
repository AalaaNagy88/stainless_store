import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/modules/ClientDetials/views/client_orders.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/client_detials_controller.dart';

class ClientDetialsView extends GetView<ClientDetialsController> {
  final List<OrderModel> model = [
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    OrderModel(
        amount: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
  ];
  @override
  Widget build(BuildContext context) {
    // Get.put(ClientDetialsController());
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: StainlessAppBar(
            context: context,
            title: S.current.clients,
            actions: controller.multiSelectController.isSelecting
                ? [
                    IconButton(
                        icon: Icon(Icons.select_all_rounded),
                        onPressed: () {
                          controller.multiSelectController.selectAll();
                        }),
                    IconButton(
                        icon: Icon(Icons.share_rounded), onPressed: () {})
                  ]
                : [],
            bottom: TabBar(
              indicatorColor: AppUi.colors.clientPink,
              labelColor: Colors.black,
              tabs: [
                Text(S.current.orders),
                Text(
                  S.current.paymentHistory,
                  softWrap: false,
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ClientOrders(),
            PaintedView(
              upPainting: false,
              child: Container(),
            ),
          ])),
    );
  }
}
