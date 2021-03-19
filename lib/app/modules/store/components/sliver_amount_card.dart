import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:stainless_v2/app/modules/store/components/custom_current_amount_card.dart';
import 'package:stainless_v2/app/modules/store/components/update_amount_manual_dialog.dart';
import 'package:stainless_v2/app/modules/store/controllers/store_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class SliverAmountCrad extends GetView<StoreController> {
  const SliverAmountCrad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      verticalOffset: -100.h,
      child: InkWell(
        onTap: () => updateAmountManualDialog(context,
            controller: controller.sliver,
            onConfirm: () => controller.updateSliverAmountManual(),
            title: S.current.sliver),
        child: Obx(
          () => controller.currentStock == null
              ? Center(child: CircularProgressIndicator())
              : CustomCurrentAmountCard(
                  context,
                  materialType: S.current.sliver,
                  amount: controller.currentStock.sliver.toString(),
                  amountColor: Colors.black,
                  materialTypeColor: AppUi.colors.blue,
                ),
        ),
      ),
    );
  }
}
