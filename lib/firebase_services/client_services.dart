import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/app/models/order_model.dart';
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
  void addNewClient(String name) async {
    await _mainRef
        .add(ClientModel(name: name).toJson())
        .then((value) => _mainRef.doc(value.id).update({"id": value.id}));
  }

  void updateClientName({String name, String id}) async {
    await _mainRef.doc(id).update({"name": name});
  }

  loadAllClients() {
    _mainRef.snapshots().listen((event) {
      clients.value =
          event.docs.map((e) => ClientModel.fromJson(e.data()).calc()).toList();
    });
  }

  deleteClient(String id) {
    _mainRef.doc(id).delete();
  }

  updateClientOrders(ClientModel client) {
    _mainRef.doc(client.id).update({"orders": orderModelToJson(client.orders)});
  }
}
