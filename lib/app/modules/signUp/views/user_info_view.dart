import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/_shared/user_photo.dart';

import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/services/user_services.dart';
import 'package:stainless_v2/utils/_export.dart';

class UserInfoView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    controller.userNameController.text = UserServices.to.user.displayName==null?"":UserServices.to.user.displayName;
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
              UserPhoto(
                pickImageServices: controller.pickImageServices,
              ),
              SizedBox(
                height: 50.h,
              ),
              AppField(
                autofocus: true,
                controller: controller.userNameController,
                hintText: S.current.name_ex,
                // ignore: missing_return
                validator: (str) {
                  if (str.isEmpty || str == null || str == "") {
                    return S.current.validation_text(S.current.clientName);
                  }
                },
              ).labeledField(S.current.user_name),
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
