import 'package:flutter/material.dart';
import 'package:stainless_v2/app/modules/store/components/custom_current_amount_card.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class SliverAmountCrad extends StatelessWidget {
  const SliverAmountCrad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      verticalOffset: -100.h,
      child: CustomCurrentAmountCard(
        context,
        materialType: S.current.sliver,
        amount: "1234",
        amountColor: Colors.black,
        materialTypeColor: AppUi.colors.blue,
      ),
    );
  }
}
