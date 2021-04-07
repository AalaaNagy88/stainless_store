import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/modules/_shared/delete_dialog.dart';
import 'package:stainless_v2/app/modules/clients/components/client_dialog.dart';
import 'package:stainless_v2/app/modules/clients/controllers/clients_controller.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';
import 'package:get/get.dart';

class ClientCard extends GetView<ClientsController> {
  final LinearGradient leadingColor;
  final Color trailingColor;
  final ClientModel client;

  const ClientCard(
      {Key key, this.leadingColor, this.trailingColor, this.client})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.endSearch();
        Get.toNamed(Routes.CLIENT_DETIALS, arguments: client);
      },
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: <Widget>[
          IconSlideAction(
              caption: S.current.edit,
              color: Colors.transparent,
              icon: Icons.edit_rounded,
              foregroundColor: Colors.green,
              onTap: () {
                controller.clientName.text = client.name;
                clientDialog(context,
                    onConfirm: () => controller.editClientName(client.id),
                    title: S.current.edit_string(S.current.name),
                    controller: controller.clientName);
              }),
          IconSlideAction(
            caption: S.current.share,
            foregroundColor: Colors.grey,
            color: Colors.transparent,
            icon: Icons.share_rounded,
            onTap: () => controller.shareClientCalcus(client),
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
              caption: S.current.delete,
              foregroundColor: Colors.red,
              color: Colors.transparent,
              icon: Icons.delete_forever_rounded,
              onTap: () => deleteDialog(context,
                  onConfirm: () => controller.deleteClient(client),
                  title: client.name)),
        ],
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: ListTile(
                leading: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      gradient: client.remains == 0
                          ? AppUi.colors.sliverGradient
                          : leadingColor,
                      borderRadius: BorderRadius.circular(40.w)),
                  child: Center(
                      child: Text(
                    client.name.split(" ").fold(
                        "",
                        (previousValue, element) =>
                            previousValue + element.substring(0, 1)),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                ),
                title: Text(
                  client.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text(
                  "${client.remains}" + S.current.el,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: client.remains == 0
                          ? Colors.grey[500]
                          : trailingColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
