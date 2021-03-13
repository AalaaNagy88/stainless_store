import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/home/components/balance_detials.dart';
import 'package:stainless_v2/app/modules/home/components/chart.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/services/user_services.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: S.current.home,
        showLeading: false,
      ),
      body: PaintedView(
        downPainting: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [BalanceDetials(), Chart()],
        ),
      ),
    );
  }
}
