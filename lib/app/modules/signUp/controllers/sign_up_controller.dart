import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/firebase_services/auth_services.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/services/user_services.dart';

class SignUpController extends GetxController {
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  Rx<CountryCode> selectedCode = Rx<CountryCode>();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String get phoneNumber =>
      "${selectedCode.value}${phoneController.text.trim()}";
  String get userName => userNameController.text;
  RxInt secondDown = RxInt();
  PickImageServices pickImageServices = PickImageServices();

  @override
  void onClose() {
    phoneController.dispose();
    SmsAutoFill().unregisterListener();
  }

  auth() {
    AuthServices().authBody(phoneNumber, secondDown);
  }

  verifyCode(String code) {
    AuthServices().verifyCode(code);
  }

  updateUserInfo() {
    UserServices.to.user.updateProfile(
        displayName: userName, photoURL: pickImageServices.photoUrl.value);
  }
}
