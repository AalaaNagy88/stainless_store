import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/AppNavigation/components/app_nav_bar_view.dart';

import 'package:stainless_v2/app/routes/app_pages.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationView extends GetView<AppNavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
          key: Get.nestedKey(1),
          initialRoute:
              AppPages.navigationRoutes[controller.currentIndex.value].name,
          onGenerateRoute: controller.onGenerateRoute),
      bottomNavigationBar: StainlessNavBar(),
    );
  }
}
