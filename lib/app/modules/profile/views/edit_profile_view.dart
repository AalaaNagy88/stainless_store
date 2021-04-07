import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/profile_controller.dart';
import 'package:stainless_v2/utils/_export.dart';

class EditProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StainlessAppBar(
          context: context,
          title: S.current.edit_string(S.current.profile),
        ),
        body: PaintedView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: ListView(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  AppField(
                    controller: controller.name,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  AppField(
                    readOnly: true,
                    showCursor: false,
                    initialValue: controller.number,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  AppRaisedButton(
                    title: S.current.edit,
                    onPressed: () => controller.chnageUserName(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
