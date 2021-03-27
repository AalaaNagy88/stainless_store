import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class StainlessAppBar extends AppBar {
  StainlessAppBar(
      {@required BuildContext context,
      String title,
      PreferredSizeWidget bottom,
      List<Widget> actions,
      bool showLeading = true})
      : super(
            centerTitle: true,
            bottom: bottom,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: showLeading
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    onPressed: () {
                      Get.back();
                    })
                : Container(),
            actions: actions,
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Get.isDarkMode
                      ? AppUi.colors.blueOfDark
                      : AppUi.colors.clientBlue,
                  fontWeight: FontWeight.w900),
            ));
}
