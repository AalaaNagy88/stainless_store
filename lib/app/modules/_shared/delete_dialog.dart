import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

Future deleteDialog(
  BuildContext context, {
  String title,
  @required Function onConfirm,
}) {
  return Get.defaultDialog(
      titleStyle: TextStyle(color: AppUi.colors.blue),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(S.current.delete_mesg(title)),
      ),
      onConfirm: onConfirm,
      onCancel: () {},
      confirmTextColor: Colors.white,
      textConfirm: S.current.delete,
      textCancel: S.current.cancel,
      barrierDismissible: false);
}
