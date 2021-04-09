import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/firebase_services/auth_services.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/firebase_services/store_services.dart';
import 'package:stainless_v2/services/user_services.dart';

class SignUpController extends GetxController with CodeAutoFill {
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  final codeController = TextEditingController();
  Rx<CountryCode> selectedCode = Rx<CountryCode>();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String get phoneNumber =>
      "${selectedCode.value}${phoneController.text.trim()}";
  String get userName => userNameController.text;
  RxInt secondDown = RxInt();
  PickImageServices pickImageServices = PickImageServices();
  AuthServices _authServices;
  @override
  void onReady() {
    _listenToIncomingMesg();
    userNameController.text = "";
    _authServices = AuthServices();
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    SmsAutoFill().unregisterListener();
  }

  auth() async {
    await _authServices.authBody(phoneNumber, secondDown);
  }

  verifyCode() async {
    await _authServices.verifyCode(codeController.text);
  }

  updateUserInfo() {
    checkIsRegistered();
    UserServices.to.user.updateProfile(
        displayName: userName, photoURL: pickImageServices.photoUrl.value);

    Get.offAllNamed(Routes.APP_NAVIGATION);
  }

  _listenToIncomingMesg() async {
    await SmsAutoFill().listenForCode;
    await SmsAutoFill().getAppSignature;
  }

  checkIsRegistered() {
    if (UserServices.to.user.displayName == null) {
      StoreServices().createNewStore();
    } else {
      userNameController.text = UserServices.to.user.displayName;
    }
  }

  @override
  void codeUpdated() {
    codeController.text = code;
  }
}
