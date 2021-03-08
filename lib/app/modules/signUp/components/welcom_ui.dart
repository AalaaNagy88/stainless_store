import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class WelcomUI extends StatelessWidget {
  final String imagePath;
  final String message;

  const WelcomUI({Key key, this.imagePath, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 250.h,
                width: ScreenUtil().screenWidth * .9,
                child: Lottie.asset(
                  imagePath,
                  repeat: false,
                )),
          ],
        ),
        Text(message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: AppUi.colors.blue, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
