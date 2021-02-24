import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppNavigationController extends GetxController {
  final pageController = PageController(initialPage: 2);
  RxInt currentIndex = RxInt();

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
  void onClose() {
    pageController.dispose();
  }

  onPageChanged(i) {
    currentIndex.value = i;
    print(currentIndex.value);
    update();
  }
}
