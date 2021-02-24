import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class StanilessNavigationItem extends BottomNavigationBarItem {
  StanilessNavigationItem({IconData icon, String label})
      : super(
          icon: Icon(icon),
          label: label,
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return AppUi.colors.blueGradient.createShader(bounds);
            },
            child: Icon(
              icon,
              size: 30.h,
            ),
          ),
        );
}
