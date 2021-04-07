import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/_shared/user_photo.dart';
import 'package:stainless_v2/app/modules/profile/views/edit_profile_view.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StainlessAppBar(
          context: context,
          title: S.current.profile,
          showLeading: false,
        ),
        body: PaintedView(
          downPainting: false,
          child: ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              UserPhoto(
                pickImageServices: controller.pickImageServices,
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text(S.current.my_informations),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => Get.to(EditProfileView()),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                leading: Icon(Icons.language_rounded),
                title: Text(S.current.change_language),
                onTap: () => controller.changeCurrentLanguage(),
                trailing: Obx(() => controller.currentIsEn.value
                    ? Image.asset(AppUi.assets.languageGrey)
                    : Image.asset(AppUi.assets.languageBlue)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                leading: Icon(Icons.brightness_medium_rounded),
                title: Text(S.current.theme),
                onTap: () => controller.changeCurrentTheme(),
                trailing: Obx(() => controller.currentIsLight.value
                    ? Icon(
                        Icons.brightness_low_outlined,
                        color: Color(0xffFDCB6E),
                      )
                    : Icon(Icons.nightlight_round, color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.login_rounded),
                title: Text(S.current.logOut),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => controller.logout(context),
              ),
            ],
          ),
        ));
  }
}
