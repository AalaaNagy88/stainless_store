import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
import 'package:stainless_v2/app/models/pay_model.dart';
import 'package:stainless_v2/firebase_services/store_services.dart';
import 'package:stainless_v2/services/user_services.dart';

class ClientServices {
  FirebaseFirestore _firestore;
  CollectionReference _mainRef;
  Rx<List<ClientModel>> clients = Rx<List<ClientModel>>();
  ClientServices() {
    _firestore = FirebaseFirestore.instance;
    _mainRef = _firestore
        .collection("user")
        .doc(UserServices.to.user.uid)
        .collection("Clients");
  }
  Future<void> addNewClient(String name) async {
    await _mainRef
        .add(ClientModel(name: name).toJson())
        .then((value) => _mainRef.doc(value.id).update({"id": value.id}));
  }

  Future<void> updateClientName({String name, String id}) async {
    await _mainRef.doc(id).update({"name": name});
  }

  loadAllClients() {
    _mainRef.snapshots().listen((event) {
      clients.value =
          event.docs.map((e) => ClientModel.fromJson(e.data()).calc()).toList();
    });
  }

  Future<void> deleteClient(
      ClientModel client, bool confirmOrdersDelete) async {
    if (client.orders.length != 0) {
      if (confirmOrdersDelete)
        StoreServices().returnClientOrdersToStore(client.orders);
    }
    await _mainRef.doc(client.id).delete();
  }

  Future<void> updateClientOrders(ClientModel client) async {
    await _mainRef
        .doc(client.id)
        .update({"orders": orderModelToJson(client.orders)});
  }

  Future<void> updateClientPayments(ClientModel client) async {
    await _mainRef
        .doc(client.id)
        .update({"payments": payModelToJson(client.payments)});
  }
}
