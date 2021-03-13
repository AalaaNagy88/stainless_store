import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/app/modules/signUp/views/user_info_view.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return BdayaCustomSplash(
      backgroundColor: Colors.white,
      backgroundBuilder: (child) {
        return child;
      },
      initFunction: controller.initFunction,
      onNavigateTo: (routeName) {
        Get.offAllNamed(routeName);
      },
      logoBuilder: () => Center(
        child: Lottie.asset(AppUi.assets.logo),
      ),
    );
  }
}
