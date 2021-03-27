import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/_export.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final Rx<DateTime> date;

  const DatePicker({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          border: Border.all(
              color: Get.isDarkMode
                  ? AppUi.colors.blueBacgroundOfDark
                  : AppUi.colors.blueBacground),
          borderRadius: BorderRadius.circular(20.w)),
      child: ListTile(
        leading: Icon(
          Icons.calendar_today_rounded,
          color: AppUi.colors.clientPink,
        ),
        title: Obx(() => Text(
              DateFormat.yMEd(Get.deviceLocale.languageCode +
                      "_" +
                      Get.deviceLocale.countryCode)
                  .format(date.value)
                  .toString(),
              style: Theme.of(context).textTheme.bodyText2,
            )),
        hoverColor:
            Get.isDarkMode ? AppUi.colors.blueOfDark : AppUi.colors.blue,
        onTap: () async {
          DateTime picked = await showDatePicker(
              context: context,
              initialDate: date.value,
              firstDate: DateTime(2020),
              lastDate: DateTime(2050));
          if (picked != null) date.value = picked;
        },
      ),
    );
  }
}
