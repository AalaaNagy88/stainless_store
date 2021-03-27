import 'package:flutter/material.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'app_card.dart';

class OrderCard extends StatelessWidget {
  final OrderModel model;

  const OrderCard({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSliver = model.color == "sliver" ? true : false;
    return AppCard(
            color: Colors.white,
            child: Column(
              children: [
                DateText(context, date: model.createdAt),
                RowData(
                  context,
                  title: S.current.type,
                  value: model.type == "sheets"
                      ? S.current.sheets
                      : S.current.ouds,
                  isSliver: isSliver,
                ),
                RowData(
                  context,
                  title: S.current.amount,
                  value: model.amount,
                  isSliver: isSliver,
                ),
                RowData(
                  context,
                  title: S.current.size,
                  value: model.size,
                  isSliver: isSliver,
                ),
                RowData(
                  context,
                  title: S.current.price,
                  value: model.price,
                  isSliver: isSliver,
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                RowData(
                  context,
                  title: S.current.totalPrice,
                  value: model.totalPrice,
                  isSliver: isSliver,
                ),
              ],
            ))
        .giveGradientBack(
            isSliver ? AppUi.colors.sliverGradient : AppUi.colors.goldGradient);
  }
}
