import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/_shared/phone_field.dart';
import 'package:stainless_v2/app/modules/signUp/components/welcom_ui.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';

import '../controllers/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return PaintedView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            WelcomUI(),
            SizedBox(
              height: 40.h,
            ),
            PhoneField(controller: controller.phoneController),
            SizedBox(
              height: 120.h,
            ),
            AppRaisedButton(
              onPressed: () => Get.toNamed(Routes.APP_NAVIGATION),
            )
          ],
        ),
      ),
    );
  }
}
