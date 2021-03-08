import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/signUp/components/welcom_ui.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PinCodeView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              WelcomUI(
                imagePath: AppUi.assets.securityGard,
                message: S.current.smsMessage,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(controller.phoneController.text),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: PinFieldAutoFill(
                  decoration: UnderlineDecoration(
                    textStyle:
                        TextStyle(fontSize: 25, color: AppUi.colors.clientPink),
                    colorBuilder: FixedColorBuilder(
                        AppUi.colors.clientPink.withOpacity(0.3)),
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              AppRaisedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.APP_NAVIGATION);
                },
                title: S.current.continues,
              )
            ],
          ),
        ),
      ),
    );
  }
}
