import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/user_model.dart';
import 'package:stainless_v2/services/user_services.dart';

class UserUtilsServices {
  RxBool isDarkMode = Get.isDarkMode.obs;
  RxString userLanguage = Get.deviceLocale.languageCode.obs;

  Future<void> updateCurrentTheme(bool isDarkMode) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(UserServices.to.user.uid)
        .update({"isDarkMode": isDarkMode});
  }

  Future<void> updateCurrentLanguage(String language) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(UserServices.to.user.uid)
        .update({"userLanguage": language});
  }

  Future<void> openUserServices() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(UserServices.to.user.uid)
        .get()
        .then(((event) {
      UserModel user = UserModel.fromJson(event.data());
      isDarkMode.value =
          user.isDarkMode == null ? Get.isDarkMode : user.isDarkMode;
      userLanguage.value = user.userLanguage == null
          ? Get.deviceLocale.languageCode
          : user.userLanguage;
    }));
  }
}
