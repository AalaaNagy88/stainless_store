import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/_export.dart';

class AppCard extends Card {
  AppCard({Widget child, Color color})
      : super(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: child));
}
