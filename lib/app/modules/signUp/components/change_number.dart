import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';

class ChangeNumber extends StatelessWidget {
  final String phoneNumber;

  const ChangeNumber({Key key, this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            S.current.sended_code,
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                phoneNumber,
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.SIGN_UP);
                  },
                  child: Text(S.current.change_phone))
            ],
          ),
        ],
      ),
    );
  }
}
