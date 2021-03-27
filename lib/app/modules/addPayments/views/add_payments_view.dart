import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/payment_form.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/add_payments_controller.dart';

class AddPaymentsView extends GetView<AddPaymentsController> {
  @override
  Widget build(BuildContext context) {
    return PaymentForm(
      appBarTitle: S.current.add,
      buttonTitle: S.current.add,
      date: controller.date,
      payedAmount: controller.payedAmount,
      onButtonPressed: () => controller.addPayment(),
    );
  }
}
