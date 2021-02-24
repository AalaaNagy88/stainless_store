import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class StainlessAppBar extends AppBar {
  StainlessAppBar(
      {@required BuildContext context,
      String title,
      PreferredSizeWidget bottom,
      bool showLeading = false})
      : super(
            bottom: bottom,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded,
                    color: AppUi.colors.blue),
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: AppUi.colors.clientBlue, fontWeight: FontWeight.w900),
            ));
}
