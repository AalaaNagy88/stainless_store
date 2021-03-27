import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/app/modules/ClientDetials/controllers/client_detials_controller.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';

class ClientOrders extends GetView<ClientDetialsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        upPainting: false,
        child: ListView.builder(
          reverse: controller.orders.length > 3 ? true : false,
          itemCount: controller.orders.length,
          itemBuilder: (_, i) => MultiSelectItem(
            isSelecting: controller.multiSelectController.isSelecting,
            onSelected: () {
              controller.multiSelectController.toggle(i);
            },
            child: Container(
              decoration: controller.multiSelectController.isSelected(i)
                  ? BoxDecoration(color: Colors.grey[300])
                  : BoxDecoration(),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.EDIT_ORDER,
                    arguments: SelectedItemOfCurrentClient(
                        client: controller.client, selectedItemIndex: i)),
                child: OrderCard(
                  model: controller.orders[i],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed(Routes.ADD_ORDER, arguments: controller.rxclient),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
