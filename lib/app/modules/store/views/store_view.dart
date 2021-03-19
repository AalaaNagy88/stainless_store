import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_bar.dart';
import 'package:stainless_v2/app/modules/_shared/app_raised_button.dart';
import 'package:stainless_v2/app/modules/_shared/painted_view.dart';
import 'package:stainless_v2/app/modules/store/components/_export.dart';
import 'package:stainless_v2/app/modules/store/components/add_new_import_dialog.dart';
import 'package:stainless_v2/app/modules/store/components/update_amount_manual_dialog.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StainlessAppBar(
        context: context,
        showLeading: false,
        title: S.current.store,
      ),
      body: PaintedView(
        downPainting: false,
        child: AnimationConfiguration.synchronized(
          duration: Duration(milliseconds: 500),
          child: ListView(
            children: [
              SizedBox(
                height: 150.h,
              ),
              SliverAmountCrad(),
              GoldenAmountCrad()
            ],
          ),
        ),
      ),
      floatingActionButton: AppRaisedButton(
        onPressed: () {
          addNewImportDialog(context, controller);
        },
        title: S.current.add_imports,
      ),
    );
  }
}
