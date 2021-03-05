import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:stainless_v2/app/models/material_model.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/material_card.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

import '../controllers/client_detials_controller.dart';

class ClientDetialsView extends GetView<ClientDetialsController> {
  final List<MaterialModel> model = [
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Gold"),
    MaterialModel(
        number: 3,
        createdAt: DateTime.now(),
        size: 3,
        price: 500,
        totalPrice: 500,
        type: "Sliver"),
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(ClientDetialsController());
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: StainlessAppBar(
            context: context,
            title: S.current.clients,
            actions: controller.multiSelectController.isSelecting
                ? [
                    IconButton(
                        icon: Icon(Icons.select_all_rounded),
                        onPressed: () {
                          controller.multiSelectController.selectAll();
                        }),
                    IconButton(
                        icon: Icon(Icons.share_rounded), onPressed: () {})
                  ]
                : [],
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
              child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (_, i) => InkWell(
                  onTap: () {
                    controller.multiSelectController.isSelecting = true;
                  },
                  child: MultiSelectItem(
                    isSelecting: controller.multiSelectController.isSelecting,
                    onSelected: () {
                      controller.multiSelectController.toggle(i);
                    },
                    child: Container(
                      decoration: controller.multiSelectController.isSelected(i)
                          ? BoxDecoration(color: Colors.grey[300])
                          : BoxDecoration(),
                      child: MaterialCard(
                        model: model[i],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            PaintedView(
              upPainting: false,
              child: Container(),
            ),
            PaintedView(
              upPainting: false,
              child: Container(),
            ),
          ])),
    );
  }
}
