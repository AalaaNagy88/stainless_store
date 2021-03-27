import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';

import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'app_card.dart';

class PaymentForm extends StatelessWidget {
  final String appBarTitle;
  final TextEditingController payedAmount;
  final Rx<DateTime> date;
  final String buttonTitle;
  final Function onButtonPressed;

  const PaymentForm(
      {Key key,
      this.appBarTitle,
      this.payedAmount,
      this.buttonTitle,
      this.date,
      this.onButtonPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StainlessAppBar(
          context: context,
          title: appBarTitle,
        ),
        body: PaintedView(
          child: Center(
            child: AppCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppField(
                    controller: payedAmount,
                    keyboardType: TextInputType.number,
                  ).labeledField(S.current.payed),
                  DatePicker(
                    date: date,
                  ),
                  Row(children: [
                    Expanded(
                      child: AppRaisedButton(
                        onPressed: () => onButtonPressed(),
                        title: buttonTitle,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
