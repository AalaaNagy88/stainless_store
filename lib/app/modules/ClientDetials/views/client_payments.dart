import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/app/modules/ClientDetials/components/selectable.dart';
import 'package:stainless_v2/app/modules/ClientDetials/controllers/client_detials_controller.dart';
import 'package:stainless_v2/app/modules/_shared/_export.dart';
import 'package:stainless_v2/app/modules/_shared/payment_card.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class ClientPayments extends GetView<ClientDetialsController> {
  const ClientPayments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaintedView(
        upPainting: false,
        child: ListView(
          children: [
            AppCard(
              child: Column(
                children: [
                  RowData(
                    context,
                    title: S.current.totalPrice,
                    value: controller.client.ordersPrice,
                    titleColor: Colors.grey[500],
                    valueColor: AppUi.colors.clientPink,
                  ),
                  RowData(
                    context,
                    title: S.current.payed,
                    value: controller.client.totalPayed,
                    titleColor: Colors.grey[500],
                    valueColor: AppUi.colors.clientPink,
                  ),
                  Divider(),
                  RowData(
                    context,
                    title: S.current.remains,
                    value: controller.client.remains,
                    titleColor: Colors.grey[500],
                    valueColor: AppUi.colors.clientPink,
                  ),
                ],
              ),
            ),
            controller.payments.length != 0
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.payments.length,
                    itemBuilder: (context, i) => Selectable(
                          child: PaymentCard(payment: controller.payments[i]),
                          index: i,
                          onTap: () => Get.toNamed(Routes.EDIT_PAYMENT,
                              arguments: SelectedItemOfCurrentClient(
                                  client: controller.client,
                                  selectedItemIndex: i)),
                        ))
                : EmptyListHint(
                    thing: S.current.paymentHistory,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed(Routes.ADD_PAYMENTS, arguments: controller.client),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
