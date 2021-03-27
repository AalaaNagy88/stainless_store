import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/clients/components/_export.dart';
import 'package:stainless_v2/generated/l10n.dart';

import '../controllers/clients_controller.dart';
import 'package:stainless_v2/utils/_export.dart';

class ClientsView extends GetView<ClientsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        title: S.current.clients,
        showLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: IconButton(
              icon: Icon(
                Icons.person_add_rounded,
                size: 40.w,
              ),
              onPressed: () => clientDialog(context,
                  onConfirm: () => controller.addClient(),
                  textConfirm: S.current.add,
                  controller: controller.clientName,
                  title: S.current.addNewClient),
            ),
          )
        ],
      ),
      body: PaintedView(
        downPainting: false,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: SearchField(context),
            ),
            ClientList()
          ],
        ),
      ),
    );
  }
}
