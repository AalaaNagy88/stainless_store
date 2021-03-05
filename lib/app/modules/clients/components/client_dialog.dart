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
      titleStyle: TextStyle(color: AppUi.colors.blue),
      title: title,
      content: AppField(
        hintText: S.current.name_ex,
        prefixIcon: Icon(Icons.person),
      ).labeledField(context, S.current.clientName),
      onConfirm: onConfirm,
      onCancel: () {},
      confirmTextColor: Colors.white,
      textConfirm: S.current.add,
      textCancel: S.current.cancel,
      barrierDismissible: false);
}
