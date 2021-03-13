import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stainless_v2/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:stainless_v2/utils/_export.dart';

class PinField extends StatelessWidget {
  const PinField({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: PinFieldAutoFill(
        onCodeSubmitted: controller.verifyCode,
        decoration: UnderlineDecoration(
          textStyle: TextStyle(fontSize: 25, color: AppUi.colors.clientPink),
          colorBuilder:
              FixedColorBuilder(AppUi.colors.clientPink.withOpacity(0.3)),
        ),
      ),
    );
  }
}
