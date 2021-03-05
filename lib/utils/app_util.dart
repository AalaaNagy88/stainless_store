import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stainless_v2/utils/app_ui.dart';

extension appShared on Widget {
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

  labeledField(context, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          this
        ],
      ),
    );
  }
}

extension textToNumConversion on String {
  double convertToDouble({double defautlValue = 1}) {
    return double.tryParse(this) ?? defautlValue;
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
