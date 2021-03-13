import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stainless_v2/generated/l10n.dart';

class TimerBody extends StatelessWidget {
  final RxInt secondDown;

  const TimerBody({Key key, this.secondDown}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          S.current.timer_mesg,
          style: TextStyle(color: Colors.grey),
        ),
        ObxValue<RxInt>(
            (_) => Text(
                  "00:" + (secondDown.toString().padLeft(2, '0')),
                  style: TextStyle(color: Colors.grey),
                ),
            secondDown)
      ],
    ));
  }
}
