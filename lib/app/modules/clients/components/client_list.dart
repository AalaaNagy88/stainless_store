import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/clients/controllers/clients_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import 'animated_client_list_body.dart';

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
              : !controller.focus.value
                  ? controller.clients.length != 0
                      ? AnimatedClientListBody(
                          list: controller.clients,
                        )
                      : ListView(
                          children: [
                            Lottie.asset(AppUi.assets.emptyList),
                            EmptyListHint(
                              thing: S.current.clients,
                            ),
                          ],
                        )
                  : controller.matching.value
                      ? AnimatedClientListBody(
                          list: controller.suggestedList,
                        )
                      : Center(child: Lottie.asset(AppUi.assets.noData)),
        ),
      ),
    );
  }
}
