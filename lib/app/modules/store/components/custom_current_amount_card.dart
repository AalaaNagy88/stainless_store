import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class CustomCurrentAmountCard extends Card {
  CustomCurrentAmountCard(context,
      {String materialType,
      String amount,
      Color materialTypeColor,
      Color amountColor})
      : super(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(materialType,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: materialTypeColor)),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  amount,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: amountColor),
                )
              ],
            ),
          ),
          elevation: 10,
        );
}
