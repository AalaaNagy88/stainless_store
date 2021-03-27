import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/payment_controller_mixin.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/firebase_services/client_payments_services.dart';

class EditPaymentController extends GetxController
    with PaymentsControllerMixin {
  final SelectedItemOfCurrentClient indexOfselected;
  EditPaymentController(this.indexOfselected);
  PayModel get payment => indexOfselected.client.payments
      .elementAt(indexOfselected.selectedItemIndex);
  ClientModel get client => indexOfselected.client;
  ClientPaymentsServices _paymentsServices = ClientPaymentsServices();
  @override
  void onInit() {
    payedAmount.text = payment.payed.toString();
    date.value = payment.createdAt;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  editPayment() {
    payment
      ..payed = payedAmountValue
      ..createdAt = date.value;
    _paymentsServices.updatePayment(client);
    Get..back()..back()..back();
  }

  deletePayment() {
    client.payments.remove(payment);
    _paymentsServices.updatePayment(client);
    Get..back()..back();
  }
}
