import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/pick_image_options.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/utils/_export.dart';

class PickPhotoButton extends StatelessWidget {
  final PickImageServices pickImageServices;

  const PickPhotoButton({Key key, this.pickImageServices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(PickOptions(
            pickImageServices: pickImageServices,
          ));
        },
        icon: Icon(
          Icons.photo_camera_outlined,
          size: 40.h,
          color: AppUi.colors.clientPink,
        ));
  }
}
