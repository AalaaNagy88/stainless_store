import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';

class AppNavigationController extends GetxController {
  RxInt currentIndex = RxInt();
  void changePage(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      Get.toNamed(AppPages.navigationRoutes[index].name, id: 1);
    }
  }

  Route onGenerateRoute(settings) {
    return GetPageRoute(
        page: AppPages.navigationRoutes[currentIndex.value].page,
        settings: settings,
        binding: AppPages.navigationRoutes[currentIndex.value].binding,
        bindings: AppPages.navigationRoutes[currentIndex.value].bindings,
        transition: Transition.fadeIn);
  }

  @override
  void onInit() {
    currentIndex.value = 2;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
