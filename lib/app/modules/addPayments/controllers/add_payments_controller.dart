import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/payment_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';
import 'package:stainless_v2/firebase_services/client_payments_services.dart';

class AddPaymentsController extends GetxController
    with PaymentsControllerMixin {
  final ClientModel client;
  AddPaymentsController(this.client);
  @override
  void onInit() {
    date.value = DateTime.now();
    super.onInit();
  }

  addPayment() {
    client.payments
        .add(PayModel(createdAt: date.value, payed: payedAmountValue));
    ClientPaymentsServices().updatePayment(client);
    Get..back()..back();
  }
}
