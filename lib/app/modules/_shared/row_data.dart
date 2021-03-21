import 'package:flutter/material.dart';
import 'package:stainless_v2/utils/_export.dart';

class RowData extends Row {
  RowData(context, {String title, dynamic value, bool isSliver = true})
      : super(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: isSliver ? AppUi.colors.sliverColor : Colors.grey),
            ),
            Text(" $value",
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: isSliver ? AppUi.colors.sliverColor : Colors.grey)),
          ],
        );
}
