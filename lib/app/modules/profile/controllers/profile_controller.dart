import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class ProfileController extends GetxController {
  RxBool currentIsEn = RxBool();
  RxBool currentIsLight = RxBool();
  @override
  void onInit() {
    currentIsEn.value = Get.deviceLocale.languageCode == "en" ? true : false;
    currentIsLight.value = Get.isDarkMode ? false : true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void changeCurrentLanguage() async {
    currentIsEn.value = !currentIsEn.value;
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

  void changeCurrentTheme() async {
    currentIsLight.value = !currentIsLight.value;
    currentIsLight.value
        ? Get.changeTheme(AppUi.themes.lighttheme)
        : Get.changeTheme(AppUi.themes.darktheme);
  }
}
