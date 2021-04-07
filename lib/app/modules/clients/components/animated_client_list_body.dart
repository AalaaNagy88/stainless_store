import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'client_card.dart';

class AnimatedClientListBody extends StatelessWidget {
  final List<ClientModel> list;

  const AnimatedClientListBody({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, i) => AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
                horizontalOffset: 100.w,
                child: FadeInAnimation(
                    child: i % 2 == 0
                        ? ClientCard(
                            leadingColor: Get.isDarkMode
                                ? AppUi.colors.clientBlueGradientOfDark
                                : AppUi.colors.clientBlueGradient,
                            trailingColor: Get.isDarkMode
                                ? AppUi.colors.blueOfDark
                                : AppUi.colors.clientBlue,
                            client: list[i],
                          )
                        : ClientCard(
                            leadingColor: AppUi.colors.clientPinkGradient,
                            trailingColor: AppUi.colors.clientPink,
                            client: list[i],
                          )))));
  }
}
