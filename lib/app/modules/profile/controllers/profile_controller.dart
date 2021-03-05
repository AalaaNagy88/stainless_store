import 'package:get/get.dart';

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
}
