import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/app/modules/store/controllers/store_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

Future addNewImportDialog(BuildContext context, StoreController controller) {
  return Get.defaultDialog(
      titleStyle: TextStyle(color: AppUi.colors.blue),
      title: S.current.add_imports,
      content: Column(
        children: [
          AppField(
            controller: controller.sliver,
            keyboardType: TextInputType.number,
          ).labeledField(S.current.sliver),
          AppField(
            controller: controller.gold,
            keyboardType: TextInputType.number,
          ).labeledField(S.current.golden),
        ],
      ),
      onConfirm: () => controller.addNewImport(),
      onCancel: () {},
      confirmTextColor: Colors.white,
      textConfirm: S.current.add,
      textCancel: S.current.cancel,
      barrierDismissible: false);
}
