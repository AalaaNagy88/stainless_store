import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/signUp/components/_export.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PinCodeView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            key: controller.key,
            child: ListView(
              children: [
                WelcomUI(
                  imagePath: AppUi.assets.securityGard,
                  message: S.current.smsMessage,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ChangeNumber(
                  phoneNumber: controller.phoneNumber,
                ),
                PinField(controller: controller),
                TimerBody(
                  secondDown: controller.secondDown,
                ),
                SizedBox(
                  height: 60.h,
                ),
                AppRaisedButton(
                  onPressed: () {
                    controller.key.currentState.save();
                  },
                  title: S.current.continues,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
