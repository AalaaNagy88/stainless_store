import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/AppNavigation/controllers/app_navigation_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'nav_item.dart';

class StainlessNavBar extends GetView<AppNavigationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: [
            StanilessNavigationItem(
                label: S.current.profile, icon: Icons.person),
            StanilessNavigationItem(
                label: S.current.payments, icon: Icons.credit_card_rounded),
            StanilessNavigationItem(label: S.current.home, icon: Icons.home),
            StanilessNavigationItem(
                label: S.current.clients, icon: Icons.group),
            StanilessNavigationItem(label: S.current.store, icon: Icons.museum),
          ],
        ).alignToLeft());
  }
}
