import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/_export.dart';

class StanilessNavigationItem extends BottomNavigationBarItem {
  StanilessNavigationItem({IconData icon, String label})
      : super(
            icon: Icon(icon),
            label: label,
            activeIcon: Icon(
              icon,
              size: 30.h,
            ).giveGradientBack(AppUi.colors.blueGradient));
}
