import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PickPhotoButton extends StatelessWidget {
  const PickPhotoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(PickOptions());
        },
        icon: Icon(
          Icons.photo_camera_outlined,
          size: 40.h,
          color: AppUi.colors.clientPink,
        ));
  }
}

class PickOptions extends GetView<SignUpController> {
  const PickOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey[700], spreadRadius: 5)
          ]),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.camera_alt_rounded,
              color: AppUi.colors.blue,
            ),
            title: Text(S.current.camera),
            onTap: () {
              Get.back();
              controller.pickImageServices.pickFromCamera();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_rounded,
              color: AppUi.colors.clientPink,
            ),
            title: Text(S.current.gallery),
            onTap: () {
              Get.back();

              controller.pickImageServices.pickFromGallery();
            },
          ),
        ],
      ),
    );
  }
}
