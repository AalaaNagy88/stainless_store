import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/payment_form.dart';
import 'package:stainless_v2/app/modules/editPayment/controllers/edit_payment_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';

class EditPaymentFormView extends GetView<EditPaymentController> {
  @override
  Widget build(BuildContext context) {
    return PaymentForm(
      appBarTitle: S.current.edit_string(S.current.payments),
      buttonTitle: S.current.edit,
      date: controller.date,
      payedAmount: controller.payedAmount,
      onButtonPressed: () => controller.editPayment(),
    );
  }
}
