import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/firebase_services/client_services.dart';
import 'package:stainless_v2/firebase_services/store_services.dart';

class ClientDetialsServices {
  addOrder(ClientModel client) {
    ClientServices().updateClientOrders(client);
    StoreServices().updateAfterNewOrder(
        client.orders.last.color, client.orders.last.amount);
  }
}
