import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/firebase_services/user_utils_services.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/services/user_services.dart';
import 'package:stainless_v2/utils/_export.dart';

class SplashController extends GetxController {
  UserUtilsServices _userUtilsServices = UserUtilsServices();
  Future<Object> initFunction() async {
    if (UserServices.to.user != null) {
      await _userUtilsServices.openUserServices();
      Locale locale = Locale(_userUtilsServices.userLanguage.value);
      await S.load(locale);
      Get.updateLocale(locale);
      _userUtilsServices.isDarkMode.value
          ? Get.changeTheme(AppUi.themes.darktheme)
          : Get.changeTheme(AppUi.themes.lighttheme);
    }
    return UserServices.to.user == null
        ? Routes.SIGN_UP
        : Routes.APP_NAVIGATION;
  }
}
