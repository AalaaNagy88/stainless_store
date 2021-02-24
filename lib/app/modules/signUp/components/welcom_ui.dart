import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class WelcomUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 250.h,
                child: Lottie.asset(AppUi.assets.moneyHero, animate: false)),
          ],
        ),
        Text(S.current.welcomeMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: AppUi.colors.blue, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
