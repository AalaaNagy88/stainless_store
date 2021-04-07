import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/app/modules/ClientDetials/components/selectable.dart';
import 'package:stainless_v2/app/modules/ClientDetials/controllers/client_detials_controller.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class ClientOrders extends GetView<ClientDetialsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        upPainting: false,
        child: controller.orders.length != 0
            ? ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (_, i) => Selectable(
                  child: OrderCard(
                    model: controller.orders[i],
                  ),
                  index: i,
                  onTap: () => Get.toNamed(Routes.EDIT_ORDER,
                      arguments: SelectedItemOfCurrentClient(
                          client: controller.client, selectedItemIndex: i)),
                ),
              )
            : EmptyListHint(
                thing: S.current.orders,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed(Routes.ADD_ORDER, arguments: controller.client),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
