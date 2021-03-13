import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/app/modules/signUp/views/user_info_view.dart';
import 'package:stainless_v2/services/user_services.dart';

class AuthServices {
  String _verificationId;

  void authBody(String phoneNumber, RxInt secondDown) async {
    _listenToIncomingMesg();
    _startTimer(secondDown);
    try {
      UserServices.to.auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: _verifcationCompleted,
          verificationFailed: _verificationFailed,
          codeSent: _codeSent,
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      Get.snackbar(e.message, "");
    }
  }

  void _verifcationCompleted(AuthCredential credential) async {
    try {
      UserCredential result =
          await UserServices.to.auth.signInWithCredential(credential);

      User user = result.user;

      if (user != null) {
        Get.to(UserInfoView());
      }
    } catch (e) {
      Get.snackbar(e.message, "");
    }
  }

  void verifyCode(String code) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code);

      await UserServices.to.auth.signInWithCredential(credential);
      Get.to(UserInfoView());
    } catch (e) {
      Get.snackbar(e.message, "");
    }
  }

  _codeSent(String verificationId, [int forceResendingToken]) {
    verificationId = verificationId;
  }

  _verificationFailed(e) {
    Get.snackbar(e.message, "");
  }

  _listenToIncomingMesg() async {
    await SmsAutoFill().listenForCode;
    await SmsAutoFill().getAppSignature;
  }

  _startTimer(RxInt secondDown) {
    secondDown.value = 60;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondDown.value == 0) {
        timer.cancel();
      } else {
        secondDown.value--;
      }
    });
  }
}
