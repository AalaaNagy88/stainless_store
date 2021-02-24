import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
}

class _AppColors {
  final Color blue = Color(0xff43A0E7);
  final Color blueBacground = Color(0xffF0F5F7);
  final Color blueAccent = Color(0xffBFDBF2);
  final Color clientBlue = Color(0xff0A9FDE);
  final Color clientPink = Color(0xffFD79A8);
  final LinearGradient blueGradient = LinearGradient(colors: [
    Color(0xff449FE7),
    Color(0xff357CB4),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient clientBlueGradient = LinearGradient(colors: [
    Color(0xff81ECEC),
    Color(0xff00B3FF),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  final LinearGradient clientPinkGradient = LinearGradient(colors: [
    Color(0xffFD79A8),
    Color(0xffFAB1A0),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

class _AppTheme {
  final theme = ThemeData(
      fontFamily: "Inter",
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedItemColor: AppUi.colors.blueAccent));
}
