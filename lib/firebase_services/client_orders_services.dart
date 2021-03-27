import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/selected_item_current_client.dart';
import 'package:stainless_v2/firebase_services/client_services.dart';
import 'package:stainless_v2/firebase_services/store_services.dart';

class ClientOrdersServices {
  addOrder(ClientModel client) async {
    await ClientServices().updateClientOrders(client);
    if (client.orders.last.type == "sheets") {
      await StoreServices().updateAfterNewOrder(
          client.orders.last.color, client.orders.last.amount);
    }
  }

  deleteOrder(SelectedItemOfCurrentClient selectedItemOfCurrentClient) async {
    OrderModel order = selectedItemOfCurrentClient.client.orders
        .elementAt(selectedItemOfCurrentClient.selectedItemIndex);
    if (order.type == "sheets")
      await StoreServices().updateAfterDeleteOrder(order.color, order.amount);
    selectedItemOfCurrentClient.client.orders.remove(order);
    await ClientServices()
        .updateClientOrders(selectedItemOfCurrentClient.client);
  }

  editOrder(SelectedItemOfCurrentClient selectedItemOfCurrentClient) {
    addOrder(selectedItemOfCurrentClient.client);
    deleteOrder(selectedItemOfCurrentClient);
  }
}
