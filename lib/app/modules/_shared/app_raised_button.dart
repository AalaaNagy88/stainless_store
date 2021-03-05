import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class AppRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;

  const AppRaisedButton({Key key, this.onPressed, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      elevation: 3,
      color: color ?? AppUi.colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
