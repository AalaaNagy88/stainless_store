import 'package:flutter/material.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/utils/app_ui.dart';
import 'package:get/get.dart';

class ClientCard extends StatelessWidget {
  final LinearGradient leadingColor;
  final Color trailingColor;

  const ClientCard({Key key, this.leadingColor, this.trailingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CLIENT_DETIALS),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: ListTile(
              leading: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    gradient: leadingColor,
                    borderRadius: BorderRadius.circular(40.w)),
                child: Center(
                    child: Text(
                  "J S",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                )),
              ),
              title: Text(
                "John Smith",
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: Text(
                " + €2803,00",
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: trailingColor, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
