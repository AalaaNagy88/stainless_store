import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension FixedDirection on Widget {
  alignToLeft() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: this,
    );
  }

  giveGradientBack(gradientColor) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradientColor.createShader(bounds);
      },
      child: this,
    );
  }
}

class AppUtil {
  static const List<String> _rtlLanguages = <String>[
    'ar', // Arabic
    'fa', // Farsi
    'he', // Hebrew
    'ps', // Pashto
    'ur', // Urdu
  ];
  static TextDirection get textDirection => _rtlLanguages.contains(currentLocal)
      ? TextDirection.rtl
      : TextDirection.ltr;
  static String get currentLocal => intl.Intl.getCurrentLocale().toLowerCase();
  static double converTodouble(String value) {
    return value == null || value.isEmpty ? 1 : double.parse(value);
  }
}
