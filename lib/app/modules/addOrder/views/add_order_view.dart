import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/custom_drop_down.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/add_order_controller.dart';

class AddOrderView extends GetView<AddOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StainlessAppBar(
          context: context,
          title: S.current.add_order,
        ),
        body: PaintedView(
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.h),
                child: ListView(
                  children: [
                    CutomDropMenu(
                      isSelected: controller.selectedType,
                      list: [
                        S.current.sheets,
                        S.current.ouds,
                      ],
                    ).labeledField(context, S.current.type),
                    CutomDropMenu(
                      isSelected: controller.selectedColor,
                      list: [
                        S.current.sliver,
                        S.current.golden,
                      ],
                    ).labeledField(context, S.current.color),
                    AppField(
                      controller: controller.number,
                      keyboardType: TextInputType.number,
                    ).labeledField(context, S.current.number),
                    AppField(
                      keyboardType: TextInputType.number,
                      controller: controller.size,
                    ).labeledField(context, S.current.size),
                    AppField(
                      keyboardType: TextInputType.number,
                      controller: controller.price,
                    ).labeledField(context, S.current.price),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      child: AppRaisedButton(
                        onPressed: () {},
                        title: S.current.add,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
