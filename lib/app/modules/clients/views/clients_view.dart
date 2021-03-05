import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/_shared/search_field.dart';
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
              icon: Icon(Icons.person_add_rounded,
                  color: AppUi.colors.blue, size: 40.w),
              onPressed: () => clientDialog(context,
                  onConfirm: () {},
                  textConfirm: S.current.add,
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
