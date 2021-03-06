import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/firebase_services/user_utils_services.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/services/user_services.dart';
import 'package:stainless_v2/utils/app_builder.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class ProfileController extends GetxController {
  final name = TextEditingController();
  String get number => UserServices.to.user.phoneNumber;
  RxBool currentIsEn = RxBool();
  RxBool currentIsLight = RxBool();
  PickImageServices pickImageServices = PickImageServices();
  UserUtilsServices _userUtilsServices;

  @override
  void onInit() async {
    _userUtilsServices = UserUtilsServices();
    await _userUtilsServices.openUserServices();
    currentIsEn.value =
        _userUtilsServices.userLanguage.value == "en" ? true : false;
    currentIsLight.value = _userUtilsServices.isDarkMode.value ? false : true;
    super.onInit();
  }

  @override
  void onReady() {
    name.text = UserServices.to.user.displayName;
    super.onReady();
  }

  @override
  void onClose() {}
  void changeCurrentLanguage() async {
    currentIsEn.value = !currentIsEn.value;
    Locale locale = Locale("en");
    String currentLanguage = "";

    if (currentIsEn.value) {
      currentLanguage = "en";
      await S.load(locale);
      Get.updateLocale(locale);
    } else {
      currentLanguage = "ar";
      locale = Locale(currentLanguage);
      await S.load(locale);
      Get.updateLocale(locale);
    }
    await _userUtilsServices.updateCurrentLanguage(currentLanguage);
  }

  void changeCurrentTheme() async {
    currentIsLight.value = !currentIsLight.value;
    currentIsLight.value
        ? Get.changeTheme(AppUi.themes.lighttheme)
        : Get.changeTheme(AppUi.themes.darktheme);
    await _userUtilsServices.updateCurrentTheme(!currentIsLight.value);
  }

  chnageUserName() {
    if (name.text.isNotEmpty)
      UserServices.to.user.updateProfile(displayName: name.text);
    Get.back();
  }

  logout(context) {
    UserServices.to.auth.signOut();
    AppBuilder.of(context).rebuild();
  }
}
