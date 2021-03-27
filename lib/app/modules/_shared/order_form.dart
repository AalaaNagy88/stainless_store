import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';

import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'app_card.dart';

class OrderForm extends StatelessWidget {
  final String appBarTitle;
  final RxString selectedColor;
  final RxString selectedType;
  final Rx<DateTime> date;
  final TextEditingController amount;
  final TextEditingController size;
  final TextEditingController price;
  final String buttonTitle;
  final Function onButtonPressed;

  const OrderForm(
      {Key key,
      this.appBarTitle,
      this.selectedColor,
      this.selectedType,
      this.amount,
      this.size,
      this.date,
      this.price,
      this.buttonTitle,
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
          child: AppCard(
            child: ListView(
              children: [
                CutomDropMenu(
                  isSelected: selectedType,
                  list: [
                    {"sheets": S.current.sheets},
                    {"ouds": S.current.ouds},
                  ],
                ).labeledField(S.current.type),
                CutomDropMenu(
                  isSelected: selectedColor,
                  list: [
                    {
                      "sliver": S.current.sliver,
                    },
                    {"gold": S.current.golden},
                  ],
                ).labeledField(S.current.color),
                AppField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                ).labeledField(S.current.amount),
                AppField(
                  keyboardType: TextInputType.number,
                  controller: size,
                ).labeledField(S.current.size),
                AppField(
                  keyboardType: TextInputType.number,
                  controller: price,
                ).labeledField(S.current.price),
                DatePicker(
                  date: date,
                ),
                AppRaisedButton(
                  onPressed: () => onButtonPressed(),
                  title: buttonTitle,
                ),
              ],
            ),
          ),
        ));
  }
}
