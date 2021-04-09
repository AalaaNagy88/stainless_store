import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/pick_button.dart';
import 'package:stainless_v2/firebase_services/pick_image_services.dart';
import 'package:stainless_v2/services/user_services.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class UserPhoto extends StatelessWidget {
  final PickImageServices pickImageServices;
  final double raduis;

  const UserPhoto({Key key, this.pickImageServices, this.raduis})
      : super(key: key);

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
              child: pickImageServices.loading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : UserServices.to.user.photoURL != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(250.h),
                          child: Image.network(UserServices.to.user.photoURL,
                              fit: BoxFit.cover))
                      : Icon(
                          Icons.person_rounded,
                          size: 100.h,
                        )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: PickPhotoButton(
            pickImageServices: pickImageServices,
          ),
        )
      ]),
    );
  }
}
