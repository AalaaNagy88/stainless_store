import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/_shared/phone_field.dart';
import 'package:stainless_v2/app/modules/signUp/components/welcom_ui.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

import '../controllers/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              WelcomUI(
                imagePath: AppUi.assets.moneyHero,
                message: S.current.welcomeMessage,
              ),
              SizedBox(
                height: 40.h,
              ),
              PhoneField(
                controller: controller.phoneController,
                selectedCode: controller.selectedCode,
              ),
              SizedBox(
                height: 120.h,
              ),
              AppRaisedButton(
                onPressed: () async {
                  await controller.auth();
                  Get.offAllNamed(Routes.PIN_CODE);
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
