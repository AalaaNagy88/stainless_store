import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/signUp/views/user_info_view.dart';
import 'package:stainless_v2/services/user_services.dart';

class AuthServices {
  String _verificationId = "";

  Future<void> authBody(String phoneNumber, RxInt secondDown) async {
    _startTimer(secondDown);
    try {
      UserServices.to.auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: _verifcationCompleted,
          verificationFailed: _verificationFailed,
          codeSent: _codeSent,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
    } catch (e) {
      Get.snackbar(e.message, "");
    }
  }

  void _verifcationCompleted(AuthCredential credential) async {
    await signIn(credential);
  }

  Future<void> verifyCode(String code) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: code);
    await signIn(credential);
  }

  _codeSent(String verificationId, [int forceResendingToken]) {
    _verificationId = verificationId;
  }

  _verificationFailed(e) {
    Get.snackbar(e.message, "");
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

  _codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
  }

  Future<void> signIn(AuthCredential credential) async {
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
}
