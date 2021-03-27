import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

Future clientDialog(BuildContext context,
    {TextEditingController controller,
    String title,
    @required Function onConfirm,
    String textConfirm}) {
  return Get.defaultDialog(
      title: title,
      content: AppField(
        hintText: S.current.name_ex,
        controller: controller,
        prefixIcon: Icon(Icons.person),
      ).labeledField(S.current.clientName),
      onConfirm: onConfirm,
      onCancel: () {},
      confirmTextColor: Colors.white,
      textConfirm: textConfirm,
      textCancel: S.current.cancel,
      barrierDismissible: false);
}
