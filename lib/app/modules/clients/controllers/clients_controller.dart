import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/search_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/firebase_services/client_services.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:share/share.dart';

class ClientsController extends GetxController with SearchControllerMixin {
  final clientName = TextEditingController();
  ClientServices _clientServices = ClientServices();
  List<ClientModel> get clients => _clientServices.clients.value;
  Rx<ClientModel> selected = Rx<ClientModel>();
  bool confirmOrdersDelete = false;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _clientServices.loadAllClients();
    super.onReady();
  }

  @override
  void onClose() {
    clientName.dispose();
  }

  addClient() {
    if (clientName.text.isNotEmpty)
      _clientServices.addNewClient(clientName.text);
    clientName.text = "";
    Get.back();
  }

  editClientName(String id) {
    _clientServices.updateClientName(name: clientName.text, id: id);
    clientName.text = "";
    Get.back();
  }

  deleteClient(ClientModel client) async {
    await _clientServices.deleteClient(client, confirmOrdersDelete);
    Get.back();
  }

  shareClientCalcus(ClientModel client) {
    String text = "";
    text += "${S.current.totalPrice} : ${client.ordersPrice}\n";
    text += "${S.current.payed} : ${client.totalPayed}\n";
    text += "${S.current.remains} : ${client.remains}\n";
    Share.share(text);
  }
}
