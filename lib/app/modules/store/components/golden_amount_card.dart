import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/store/components/custom_current_amount_card.dart';
import 'package:stainless_v2/app/modules/store/components/update_amount_manual_dialog.dart';
import 'package:stainless_v2/app/modules/store/controllers/store_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class GoldenAmountCrad extends GetView<StoreController> {
  const GoldenAmountCrad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
        verticalOffset: 100.h,
        child: InkWell(
            onTap: () => updateAmountManualDialog(context,
                controller: controller.gold,
                onConfirm: () => controller.updateGoldAmountManual(),
                title: S.current.golden),
            child: Obx(() => controller.currentStock == null
                ? Center(child: CircularProgressIndicator())
                : CustomCurrentAmountCard(
                    context,
                    materialType: S.current.golden,
                    amount: controller.currentStock.gold.toString(),
                    amountColor: Colors.black,
                    materialTypeColor: Colors.grey,
                  ).giveGradientBack(AppUi.colors.clientPinkGradient))));
  }
}
