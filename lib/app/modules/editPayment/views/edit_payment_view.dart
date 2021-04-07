import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/_shared/payment_card.dart';
import 'package:stainless_v2/app/modules/editPayment/controllers/edit_payment_controller.dart';
import 'package:stainless_v2/app/modules/editPayment/views/edit_payment_form_view.dart';
import 'package:stainless_v2/generated/l10n.dart';

class EditPaymentView extends GetView<EditPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: controller.indexOfselected.client.name,
        actions: [
          IconButton(
              icon: Icon(Icons.share_rounded),
              onPressed: () => controller.sharePayment())
        ],
      ),
      body: PaintedView(
        upPainting: false,
        child: Center(child: PaymentCard(payment: controller.payment)),
      ),
      bottomNavigationBar: BottomButtons(
        title: S.current.payed,
        onEdit: () => Get.to(EditPaymentFormView()),
        onDelete: () => controller.deletePayment(),
      ),
    );
  }
}
