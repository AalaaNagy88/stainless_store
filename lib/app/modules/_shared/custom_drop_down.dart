import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:stainless_v2/utils/_export.dart';

class CutomDropMenu extends StatelessWidget {
  final List list;
  final RxString isSelected;

  const CutomDropMenu({Key key, this.list, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * .8,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
          color: AppUi.colors.blueBacground,
          borderRadius: BorderRadius.circular(15.h)),
      child: ObxValue<RxString>(
          (_) => DropdownButton(
                value: isSelected.value,
                underline: Container(),
                icon: Icon(Icons.keyboard_arrow_down,
                    color: AppUi.colors.clientPink),
                isExpanded: true,
                hint: Text(
                  isSelected.value,
                ),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: AppUi.colors.clientPink),
                items: list
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  isSelected.value = value;
                  print(value);
                },
              ),
          isSelected),
    );
  }
}