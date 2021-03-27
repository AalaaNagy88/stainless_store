import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/pay_model.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PaymentCard extends StatelessWidget {
  final PayModel payment;

  const PaymentCard({Key key, this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateText(
            context,
            date: payment.createdAt,
            color: Get.isDarkMode ? AppUi.colors.blueOfDark : AppUi.colors.blue,
          ),
          RowData(
            context,
            title: S.current.payed,
            value: payment.payed,
            titleColor: Colors.grey[500],
            valueColor: AppUi.colors.clientPink,
          ),
        ],
      ),
    );
  }
}
