import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

Future updateAmountManualDialog(BuildContext context,
    {String title, Function onConfirm, TextEditingController controller}) {
  return Get.defaultDialog(
      titleStyle: TextStyle(color: AppUi.colors.blue),
      title: S.current.update_material_amount(title),
      content: AppField(
        controller: controller,
        keyboardType: TextInputType.number,
      ).labeledField(title),
      onConfirm: onConfirm,
      onCancel: () {},
      confirmTextColor: Colors.white,
      textConfirm: S.current.save_edits,
      textCancel: S.current.cancel,
      barrierDismissible: false);
}
