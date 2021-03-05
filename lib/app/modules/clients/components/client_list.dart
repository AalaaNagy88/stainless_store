import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stainless_v2/app/modules/clients/components/client_card.dart';
import 'package:stainless_v2/utils/_export.dart';

class ClientList extends StatelessWidget {
  const ClientList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AnimationLimiter(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (_, i) => AnimationConfiguration.staggeredList(
              position: i,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                  horizontalOffset: 100.w,
                  child: FadeInAnimation(
                      child: i % 2 == 0
                          ? ClientCard(
                              leadingColor: AppUi.colors.clientBlueGradient,
                              trailingColor: AppUi.colors.clientBlue,
                            )
                          : ClientCard(
                              leadingColor: AppUi.colors.clientPinkGradient,
                              trailingColor: AppUi.colors.clientPink,
                            ))))),
    ));
  }
}
