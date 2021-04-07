import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class EmptyListHint extends StatelessWidget {
  final String thing;

  const EmptyListHint({Key key, this.thing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.current.no_thing(thing),
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: Get.isDarkMode
                  ? AppUi.colors.blueOfDark
                  : AppUi.colors.blue)),
    );
  }
}
