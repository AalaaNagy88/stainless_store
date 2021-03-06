import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/generated/l10n.dart';

class ProfileController extends GetxController {
  RxBool currentIsEn = RxBool();
  @override
  void onInit() {
    currentIsEn.value = Get.deviceLocale.languageCode == "en" ? true : false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void onChange(i) async {
    currentIsEn.value = i;
    Locale locale = Locale("en");

    if (currentIsEn.value) {
      await S.load(locale);
      Get.updateLocale(locale);
    } else {
      locale = Locale("ar");
      await S.load(locale);
      Get.updateLocale(locale);
    }
  }
}
