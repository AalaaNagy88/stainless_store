import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/_export.dart';

mixin OrderControllerMixin on GetxController {
  final price = TextEditingController();
  final size = TextEditingController();
  final amount = TextEditingController();

  double get priceValue => price.text.convertToDouble();
  double get sizeValue => size.text.convertToDouble();
  double get amountValue => amount.text.convertToDouble();
}
