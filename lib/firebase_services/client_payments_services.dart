import 'package:stainless_v2/app/models/client_model.dart';

import 'client_services.dart';

class ClientPaymentsServices {
  updatePayment(ClientModel client) async {
    await ClientServices().updateClientPayments(client);
  }
}
