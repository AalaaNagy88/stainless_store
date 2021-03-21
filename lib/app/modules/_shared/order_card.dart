import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/modules/_shared/row_data.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderModel model;

  const OrderCard({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSliver = model.color == "sliver" ? true : false;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w)),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          DateFormat.yMEd(Get.deviceLocale.languageCode +
                                  "_" +
                                  Get.deviceLocale.countryCode)
                              .format(model.createdAt)
                              .toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
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
                      Divider(),
                      RowData(
                        context,
                        title: S.current.totalPrice,
                        value: model.totalPrice,
                        isSliver: isSliver,
                      ),
                    ],
                  ),
                ))
            .giveGradientBack(isSliver
                ? AppUi.colors.sliverGradient
                : AppUi.colors.goldGradient));
  }
}
