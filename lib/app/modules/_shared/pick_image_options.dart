import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PickOptions extends StatelessWidget {
  final PickImageServices pickImageServices;

  const PickOptions({Key key, this.pickImageServices}) : super(key: key);

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
            title: Text(
              S.current.camera,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.grey[700]),
            ),
            onTap: () {
              Get.back();
              pickImageServices.pickFromCamera();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_rounded,
              color: AppUi.colors.clientPink,
            ),
            title: Text(
              S.current.gallery,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.grey[700]),
            ),
            onTap: () {
              Get.back();
              pickImageServices.pickFromGallery();
            },
          ),
        ],
      ),
    );
  }
}
