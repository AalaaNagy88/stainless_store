import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/ClientDetials/views/client_orders.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/client_detials_controller.dart';
import 'client_payments.dart';

class ClientDetialsView extends GetView<ClientDetialsController> {
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
              labelColor: Get.isDarkMode ? Colors.white : Colors.black,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              tabs: [
                Text(S.current.orders),
                Text(
                  S.current.paymentHistory,
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ClientOrders(),
            ClientPayments(),
          ])),
    );
  }
}
