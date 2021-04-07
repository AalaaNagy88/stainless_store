import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/user_model.dart';

class UserServices extends GetxService {
  static UserServices get to => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString userPhoto = RxString();
  RxBool isDarkMode = false.obs;
  RxString userLanguage = "en".obs;

  User get user => auth.currentUser;

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
    FirebaseFirestore.instance
        .collection("user")
        .doc(UserServices.to.user.uid)
        .snapshots()
        .listen((event) {
      UserModel user = UserModel.fromJson(event.data());
      isDarkMode.value =
          user.isDarkMode == null ? Get.isDarkMode : user.isDarkMode;
      userLanguage.value = user.userLanguage == null
          ? Get.deviceLocale.languageCode
          : user.userLanguage;
      print(isDarkMode.value);
    });
  }
}
