import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/editOrder/views/edit_order_form_view.dart';

import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';
import '../controllers/edit_order_controller.dart';

class EditOrderView extends GetView<EditOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: controller.indexOfselected.client.name,
        actions: [
          IconButton(
              icon: Icon(Icons.share_rounded),
              onPressed: () => controller.shareOrder())
        ],
      ),
      body: PaintedView(
          upPainting: false,
          child: Center(
            child: AppCard(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DateText(
                  context,
                  date: controller.order.createdAt,
                  color: Get.isDarkMode
                      ? AppUi.colors.blueOfDark
                      : AppUi.colors.blue,
                ),
                RowData(
                  context,
                  title: S.current.type,
                  value: controller.order.type == "sheets"
                      ? S.current.sheets
                      : S.current.ouds,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
                RowData(
                  context,
                  title: S.current.color,
                  value: controller.order.color == "sliver"
                      ? S.current.sliver
                      : S.current.golden,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
                RowData(
                  context,
                  title: S.current.amount,
                  value: controller.order.amount,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
                RowData(
                  context,
                  title: S.current.size,
                  value: controller.order.size,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
                RowData(
                  context,
                  title: S.current.price,
                  value: controller.order.price,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                RowData(
                  context,
                  title: S.current.totalPrice,
                  value: controller.order.totalPrice,
                  titleColor: Colors.grey[500],
                  valueColor: AppUi.colors.clientPink,
                ),
              ],
            )),
          )),
      bottomNavigationBar: BottomButtons(
        title: S.current.order,
        onEdit: () => Get.to(EditOrderFormView()),
        onDelete: () => controller.deleteOrder(),
      ),
    );
  }
}
