import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/_export.dart';

mixin PaymentsControllerMixin on GetxController {
  final payedAmount = TextEditingController();
  Rx<DateTime> date = Rx<DateTime>();
  double get payedAmountValue => payedAmount.text.convertToDouble();
  @override
  void onClose() {
    payedAmount.dispose();
    super.onClose();
  }
}
