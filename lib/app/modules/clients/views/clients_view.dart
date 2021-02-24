import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/_shared/search_field.dart';
import 'package:stainless_v2/app/modules/clients/components/client_card.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: S.current.clients,
      ),
      body: PaintedView(
        downPainting: false,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: SearchField(context),
            ),
            Expanded(
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
                                      leadingColor:
                                          AppUi.colors.clientBlueGradient,
                                      trailingColor: AppUi.colors.clientBlue,
                                    )
                                  : ClientCard(
                                      leadingColor:
                                          AppUi.colors.clientPinkGradient,
                                      trailingColor: AppUi.colors.clientPink,
                                    ))))),
            ))
          ],
        ),
      ),
    );
  }
}
