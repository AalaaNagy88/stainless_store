import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/order_form.dart';
import 'package:stainless_v2/app/modules/editOrder/controllers/edit_order_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';

class EditOrderFormView extends GetView<EditOrderController> {
  @override
  Widget build(BuildContext context) {
    return OrderForm(
      appBarTitle: S.current.edit_string(S.current.order),
      selectedType: controller.selectedType,
      selectedColor: controller.selectedColor,
      amount: controller.amount,
      price: controller.price,
      size: controller.size,
      date: controller.date,
      onButtonPressed: () => controller.editOrder(),
      buttonTitle: S.current.edit,
    );
  }
}
