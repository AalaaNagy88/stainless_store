import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/main_binding.dart';
import 'package:stainless_v2/utils/app_builder.dart';
import 'package:stainless_v2/utils/app_ui.dart';
import 'package:stainless_v2/utils/app_util.dart';

class StainlessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(
        builder: (context) => ScreenUtilInit(
              builder: () => GetMaterialApp(
                title: "StainStore",
                localizationsDelegates: [
                  S.delegate,
                  CountryLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: (context, _) => Directionality(
                  textDirection: AppUtil.textDirection,
                  child: _,
                ),
                theme: AppUi.themes.lighttheme,
                debugShowCheckedModeBanner: false,
                supportedLocales: S.delegate.supportedLocales,
                darkTheme: AppUi.themes.darktheme,
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                initialBinding: MainBinding(),
              ),
            ));
  }
}
