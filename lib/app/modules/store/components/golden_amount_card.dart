import 'package:flutter/material.dart';
import 'package:stainless_v2/app/modules/store/components/custom_current_amount_card.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class GoldenAmountCrad extends StatelessWidget {
  const GoldenAmountCrad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
        verticalOffset: 100.h,
        child: CustomCurrentAmountCard(
          context,
          materialType: S.current.golden,
          amount: "1234",
          amountColor: Colors.black,
          materialTypeColor: Colors.grey,
        ).giveGradientBack(AppUi.colors.clientPinkGradient));
  }
}
