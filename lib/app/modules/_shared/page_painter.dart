import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stainless_v2/utils/app_util.dart';

class PagePainter extends CustomPainter {
  final bool upPainting;
  final bool downPainting;

  PagePainter({this.upPainting, this.downPainting});
  @override
  void paint(Canvas canvas, Size size) {
    double _raduis = 150.w;
    Paint paint = Paint();
    paint.color = Color(0xFF0A9FDE).withOpacity(.08);
    if (upPainting) {
      if (AppUtil.textDirection == TextDirection.ltr) {
        canvas.drawCircle(Offset(_raduis * .3, 50), _raduis, paint);
        canvas.drawCircle(
            Offset(_raduis + _raduis * .3, -_raduis * .4), _raduis, paint);
      } else {
        canvas.drawCircle(Offset(-_raduis * .3, 50), _raduis, paint);
        canvas.drawCircle(
            Offset(-_raduis + _raduis * .3, -_raduis * .4), _raduis, paint);
      }
    }
    if (downPainting) {
      if (AppUtil.textDirection == TextDirection.ltr) {
        canvas.drawCircle(
            Offset(ScreenUtil().screenWidth - (_raduis * .7),
                ScreenUtil().screenHeight - _raduis / 2),
            _raduis,
            paint);
        canvas.drawCircle(
            Offset(ScreenUtil().screenWidth + (_raduis * .3),
                ScreenUtil().screenHeight - _raduis * 1.2),
            _raduis,
            paint);
      } else {
        canvas.drawCircle(
            Offset(-(ScreenUtil().screenWidth - (_raduis * .7)),
                ScreenUtil().screenHeight - _raduis / 2),
            _raduis,
            paint);
        canvas.drawCircle(
            Offset(-(ScreenUtil().screenWidth + (_raduis * .3)),
                ScreenUtil().screenHeight - _raduis * 1.2),
            _raduis,
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(oldDelegate) => false;
}
