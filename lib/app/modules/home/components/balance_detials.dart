import 'package:flutter/material.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class BalanceDetials extends StatelessWidget {
  const BalanceDetials({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.current.total_balance,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "123456789",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: AppUi.colors.blue),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: ScreenUtil().screenWidth * .4,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: AppUi.colors.clientPinkGradient,
              borderRadius: BorderRadius.circular(30.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
              Text(S.current.show,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
