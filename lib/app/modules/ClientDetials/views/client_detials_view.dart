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
    return WillPopScope(
      onWillPop: () => controller.onWillPop(),
      child: Obx(
        () => Scaffold(
            appBar: StainlessAppBar(
              context: context,
              title: controller.client.name,
              actions: controller.isSelecting.value
                  ? [
                      IconButton(
                          icon: Icon(Icons.select_all_rounded),
                          onPressed: () {
                            controller.tabController.index == 0
                                ? controller.listLength =
                                    controller.orders.length
                                : controller.listLength =
                                    controller.payments.length;
                            controller.toggleAll();
                          }),
                      IconButton(
                          icon: Icon(Icons.share_rounded),
                          onPressed: () => controller.share())
                    ]
                  : [],
              bottom: TabBar(
                controller: controller.tabController,
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
            body: TabBarView(controller: controller.tabController, children: [
              ClientOrders(),
              ClientPayments(),
            ])),
      ),
    );
  }
}
