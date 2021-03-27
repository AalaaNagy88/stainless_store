import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/order_form.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/add_order_controller.dart';

class AddOrderView extends GetView<AddOrderController> {
  @override
  Widget build(BuildContext context) {
    return OrderForm(
      appBarTitle: S.current.add_order,
      selectedType: controller.selectedType,
      selectedColor: controller.selectedColor,
      amount: controller.amount,
      price: controller.price,
      date: controller.date,
      size: controller.size,
      onButtonPressed: () => controller.addOrder(),
      buttonTitle: S.current.add,
    );
  }
}
