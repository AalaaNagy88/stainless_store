import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/payement_controller.dart';

class PayementView extends GetView<PayementController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: S.current.add,
      ),
      body: Center(
        child: Text(
          'PayementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
