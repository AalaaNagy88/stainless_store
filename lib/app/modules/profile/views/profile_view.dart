import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
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
              Container(
                child: Center(
                    child: Text(
                  "ع",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppUi.colors.clientPinkGradient),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTileTheme(
                iconColor: AppUi.colors.blue,
                child: ListTile(
                  leading: Icon(Icons.person_rounded),
                  title: Text(S.current.my_informations),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTileTheme(
                iconColor: AppUi.colors.blue,
                child: ListTile(
                  leading: Icon(Icons.language_rounded),
                  title: Text(S.current.change_language),
                  trailing: Switch(
                    value: true,
                    onChanged: (i) {},
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTileTheme(
                iconColor: AppUi.colors.blue,
                child: ListTile(
                  leading: Icon(Icons.brightness_medium_rounded),
                  title: Text(S.current.theme),
                  trailing: Obx(
                    () => Switch(
                      activeColor: Colors.white,
                      activeThumbImage: AssetImage(AppUi.assets.languageBlue),
                      inactiveThumbImage: AssetImage(AppUi.assets.languageGrey),
                      value: controller.currentIsEn.value,
                      onChanged: (i) {
                        controller.currentIsEn.value = i;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
