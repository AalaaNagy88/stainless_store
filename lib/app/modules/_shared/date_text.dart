import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateText extends Center {
  DateText(context, {DateTime date, Color color})
      : super(
          child: Text(
            DateFormat.yMEd(Get.deviceLocale.languageCode +
                    "_" +
                    Get.deviceLocale.countryCode)
                .format(date)
                .toString(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: color == null ? Colors.black : color),
          ),
        );
}
