import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/modules/ClientDetials/controllers/client_detials_controller.dart';
import 'package:stainless_v2/app/modules/_shared/order_card.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';

class ClientOrders extends GetView<ClientDetialsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        upPainting: false,
        child: ObxValue<Rx<ClientModel>>(
            (_) => ListView.builder(
                  reverse: true,
                  itemCount: controller.client.orders.length,
                  itemBuilder: (_, i) => InkWell(
                    onTap: () {},
                    child: MultiSelectItem(
                      isSelecting: controller.multiSelectController.isSelecting,
                      onSelected: () {
                        controller.multiSelectController.toggle(i);
                      },
                      child: Container(
                        decoration:
                            controller.multiSelectController.isSelected(i)
                                ? BoxDecoration(color: Colors.grey[300])
                                : BoxDecoration(),
                        child: OrderCard(
                          model: controller.client.orders[i],
                        ),
                      ),
                    ),
                  ),
                ),
            controller.rxclient),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed(Routes.ADD_ORDER, arguments: controller.rxclient),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
