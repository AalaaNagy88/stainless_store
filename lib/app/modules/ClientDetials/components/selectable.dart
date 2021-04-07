import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:stainless_v2/app/modules/ClientDetials/controllers/client_detials_controller.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class Selectable extends GetView<ClientDetialsController> {
  final int index;
  final Widget child;
  final void Function() onTap;

  const Selectable({Key key, this.index, this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: controller.isSelected(index)
            ? BoxDecoration(color: AppUi.colors.clientPink.withOpacity(.3))
            : BoxDecoration(),
        child: InkWell(
            onTap: onTap,
            onLongPress: () => controller.toggle(index),
            child: child),
      ),
    );
  }
}
