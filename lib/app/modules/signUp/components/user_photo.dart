import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/signUp/components/pick_button.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/services/user_services.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class UserPhoto extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Obx(
          () => Container(
            width: 200.w,
            height: 200.h,
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[100], width: 2)),
            child: UserServices.to.user.photoURL != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(250.h),
                    child: Image.network(
                      controller.pickImageServices.photoUrl.value,
                      fit: BoxFit.cover,
                    ))
                : controller.pickImageServices.photoUrl.value.isEmpty
                    ? controller.pickImageServices.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Icon(
                            Icons.person_rounded,
                            size: 100.h,
                          )
                    : controller.pickImageServices.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(250.h),
                            child: Image.network(
                              controller.pickImageServices.photoUrl.value,
                              fit: BoxFit.cover,
                            )),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: PickPhotoButton(),
        )
      ]),
    );
  }
}
