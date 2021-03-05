import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/_export.dart';
import 'sheet_controller_mixin.dart';

mixin OudControllerMixin on SheetControllerMixin {
  final price = TextEditingController();

  double get priceText => price.text.convertToDouble();
}
