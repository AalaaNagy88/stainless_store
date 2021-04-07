import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:stainless_v2/app/modules/home/controllers/home_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class BalanceDetials extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            S.current.total_balance,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          if (controller.showBalance.value)
            Text(
              "${controller.totalBalance}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: AppUi.colors.blue),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () =>
                controller.showBalance.value = !controller.showBalance.value,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              child: Container(
                width: ScreenUtil().screenWidth * .4,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: AppUi.colors.clientPinkGradient,
                    borderRadius: BorderRadius.circular(30.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      controller.showBalance.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                        controller.showBalance.value
                            ? S.current.hide
                            : S.current.show,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
