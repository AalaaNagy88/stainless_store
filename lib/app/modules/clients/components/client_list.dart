import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/clients/components/client_card.dart';
import 'package:stainless_v2/app/modules/clients/controllers/clients_controller.dart';
import 'package:stainless_v2/utils/_export.dart';

class ClientList extends GetView<ClientsController> {
  const ClientList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AnimationLimiter(
      child: Obx(
        () => controller.clients == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.clients.length,
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
                                    client: controller.clients[i],
                                  )
                                : ClientCard(
                                    leadingColor:
                                        AppUi.colors.clientPinkGradient,
                                    trailingColor: AppUi.colors.clientPink,
                                    client: controller.clients[i],
                                  ))))),
      ),
    ));
  }
}
