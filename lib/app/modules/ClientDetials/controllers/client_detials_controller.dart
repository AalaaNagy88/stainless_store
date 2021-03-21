import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/selectable_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';

class ClientDetialsController extends GetxController
    with SelectableControllerMixin {
  final Rx<ClientModel> rxclient;
  ClientModel get client => rxclient.value;
  ClientDetialsController(this.rxclient);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
