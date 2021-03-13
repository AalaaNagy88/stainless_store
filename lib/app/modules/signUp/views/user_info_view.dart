import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/signUp/components/_export.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class UserInfoView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PaintedView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              SizedBox(
                height: 100.h,
              ),
              UserPhoto(),
              SizedBox(
                height: 50.h,
              ),
              AppField(
                controller: controller.userNameController,
                hintText: S.current.name_ex,
                // ignore: missing_return
                validator: (str) {
                  if (str.isEmpty || str == null) {
                    return S.current.validation_text(S.current.clientName);
                  }
                },
              ).labeledField(context, S.current.user_name),
              SizedBox(
                height: 100.h,
              ),
              AppRaisedButton(
                onPressed: () => controller.updateUserInfo(),
                title: S.current.continues,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
