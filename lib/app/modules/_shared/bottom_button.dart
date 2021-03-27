import 'package:flutter/material.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class BottomButtons extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;

  const BottomButtons({Key key, @required this.onEdit, @required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: AppRaisedButton(
                onPressed: () => onDelete(),
                color: Colors.red[200],
                title: S.current.delete,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: AppRaisedButton(
                onPressed: () => onEdit(),
                title: S.current.edit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
