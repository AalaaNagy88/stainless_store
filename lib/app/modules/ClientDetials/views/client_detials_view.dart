import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/client_detials_controller.dart';

class ClientDetialsView extends GetView<ClientDetialsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
            appBar: StainlessAppBar(
              context: context,
              title: S.current.clients,
              bottom: TabBar(
                indicatorColor: AppUi.colors.clientPink,
                labelColor: Colors.black,
                tabs: [
                  Text(
                    S.current.sheets,
                  ),
                  Text(S.current.ouds),
                  Text(
                    S.current.paymentHistory,
                    softWrap: false,
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              PaintedView(
                upPainting: false,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w)),
                  child: Text(
                    "Test",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: AppUi.colors.clientBlue),
                  ),
                ).giveGradientBack(AppUi.colors.sliverGradient),
              ),
              PaintedView(
                upPainting: false,
                child: Container(),
              ),
              PaintedView(
                upPainting: false,
                child: Container(),
              ),
            ])));
  }
}
