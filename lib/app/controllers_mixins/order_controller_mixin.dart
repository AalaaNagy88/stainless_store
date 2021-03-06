import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/_export.dart';

mixin OrderControllerMixin on GetxController {
  final price = TextEditingController();
  final size = TextEditingController();
  final number = TextEditingController();

  double get priceText => price.text.convertToDouble();
  double get sizeText => size.text.convertToDouble();
  double get numberText => number.text.convertToDouble();
}
