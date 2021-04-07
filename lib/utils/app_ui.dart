import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

extension AppColors on Colors {
  static Color get appBlue => const Color(0xff43A0E7);
}

class AppUi {
  static _AppAssets get assets => _AppAssets();
  static _AppColors get colors => _AppColors();
  static _AppTheme get themes => _AppTheme();
}

class _AppAssets {
  final String moneyHero = "assets/flare/money_hero.json";
  final String noData = "assets/flare/no_data.json";
  final String emptyList = "assets/flare/empty_client_list.json";
  final String logo = "assets/flare/logo.json";
  final String securityGard = "assets/flare/security_gard.json";
  final String languageGrey = "assets/icons/language_grey.png";
  final String languageBlue = "assets/icons/language_blue.png";
}

class _AppColors {
  final Color blue = Color(0xff43A0E7);
  final Color blueOfDark = Color(0xff19E8E3);
  final Color blueBacground = Color(0xffF0F5F7);
  final Color blueBacgroundOfDark = Color(0xff25292C);
  final Color blueAccent = Color(0xffBFDBF2);
  final Color clientBlue = Color(0xff0A9FDE);
  final Color clientPink = Color(0xffFD79A8);
  final Color sliverColor = Color(0xff8886E7);
  final LinearGradient blueLightGradient = LinearGradient(colors: [
    Color(0xff449FE7),
    Color(0xff357CB4),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient blueDarkGradient = LinearGradient(colors: [
    Color(0xff19E8E3),
    Color(0xff357CB4),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient clientBlueGradient = LinearGradient(colors: [
    Color(0xff81ECEC),
    Color(0xff00B3FF),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient clientBlueGradientOfDark = LinearGradient(colors: [
    Color(0xff19E8E3),
    Color(0xff64C4B9),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient clientPinkGradient = LinearGradient(colors: [
    Color(0xffFD79A8),
    Color(0xffFAB1A0),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient sliverGradient = LinearGradient(colors: [
    Color(0xffEBEBF5),
    Color(0xffB9B9E3),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient goldGradient = LinearGradient(colors: [
    Color(0xffFDCB6E),
    Color(0xffEFDAB3),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

class _AppTheme {
  final lighttheme = ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: AppUi.colors.blue, size: 40.w),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppUi.colors.blue, size: 40.w)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedItemColor: AppUi.colors.blueAccent));
  final darktheme = ThemeData.dark().copyWith(
      primaryColor: AppUi.colors.blueOfDark,
      accentColor: AppUi.colors.blueOfDark,
      iconTheme: IconThemeData(color: AppUi.colors.blueOfDark, size: 40.w),
      appBarTheme: AppBarTheme(
          actionsIconTheme:
              IconThemeData(color: AppUi.colors.blueOfDark, size: 40.w),
          iconTheme: IconThemeData(color: AppUi.colors.blueOfDark, size: 40.w)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedItemColor: AppUi.colors.blueAccent));
}
