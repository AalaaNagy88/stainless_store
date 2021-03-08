import 'package:country_code_picker/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignUpController extends GetxController {
  final phoneController = TextEditingController();
  Rx<CountryCode> selectedCode = Rx<CountryCode>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    SmsAutoFill().unregisterListener();
  }

  auth() async {
    await SmsAutoFill().listenForCode;
    await SmsAutoFill().getAppSignature;
    FirebaseAuth auth = FirebaseAuth.instance;
    print(selectedCode.value.dialCode + phoneController.text);
    auth.verifyPhoneNumber(
      phoneNumber: selectedCode.value.dialCode + phoneController.text,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        UserCredential result = await auth.signInWithCredential(credential);

        User user = result.user;

        if (user != null) {
          print(user.phoneNumber);
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        Get.dialog(AlertDialog(
          title: Text("Give the code?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // TextField(
              //   controller: _codeController,
              // ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Confirm"),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () async {
                // final code = _codeController.text.trim();
                // AuthCredential credential =
                //     PhoneAuthProvider.getCredential(
                //         verificationId: verificationId, smsCode: code);

                // AuthResult result =
                //     await _auth.signInWithCredential(credential);

                // FirebaseUser user = result.user;

                // if (user != null) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => HomeScreen(
                //                 user: user,
                //               )));
                // } else {
                //   print("Error");
                // }
              },
            )
          ],
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        print(verificationId);
        print("Timout");
      },
    );
  }
}
