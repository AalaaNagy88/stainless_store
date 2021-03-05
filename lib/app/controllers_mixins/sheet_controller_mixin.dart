import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/_export.dart';

mixin SheetControllerMixin on GetxController {
  final number = TextEditingController();
  final size = TextEditingController();

  double get numberText => number.text.convertToDouble();
  double get sizeText => size.text.convertToDouble();
}
