import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/AppNavigation/components/nav_item.dart';
import 'package:stainless_v2/app/modules/clients/views/clients_view.dart';
import 'package:stainless_v2/app/modules/home/views/home_view.dart';
import 'package:stainless_v2/app/modules/payments/views/payments_view.dart';
import 'package:stainless_v2/app/modules/profile/views/profile_view.dart';
import 'package:stainless_v2/app/modules/store/views/store_view.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationView extends GetView<AppNavigationController> {
  //final root = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // key: root,
        // body: Stack(children: [
        //   Positioned.fill(
        //     child: Navigator(onGenerateRoute: (settings) {
        //       print("test");
        //       print(AppPages
        //           .navigationRoutes[controller.currentIndex.value].name);
        //       return GetPageRoute(
        //           page: AppPages
        //               .navigationRoutes[controller.currentIndex.value].page,
        //           settings: settings,
        //           binding: AppPages
        //               .navigationRoutes[controller.currentIndex.value].binding,
        //           bindings: AppPages
        //               .navigationRoutes[controller.currentIndex.value].bindings,
        //           transition: Transition.fadeIn);
        //     }),
        //   ),
        // ]),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (i) => controller.currentIndex.value = i,
          children: [
            ProfileView(),
            PaymentsView(),
            HomeView(),
            ClientsView(),
            StoreView()
          ],
        ),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (i) => controller.pageController.jumpToPage(i),
            items: [
              StanilessNavigationItem(
                  label: S.current.profile, icon: Icons.person),
              StanilessNavigationItem(
                  label: S.current.payments, icon: Icons.credit_card_rounded),
              StanilessNavigationItem(label: S.current.home, icon: Icons.home),
              StanilessNavigationItem(
                  label: S.current.clients, icon: Icons.group),
              StanilessNavigationItem(
                  label: S.current.store, icon: Icons.museum),
            ],
          ),
        ),
      ),
    );
  }
}
