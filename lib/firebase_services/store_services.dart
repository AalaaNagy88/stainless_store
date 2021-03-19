import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stainless_v2/app/models/store_model.dart';
import 'package:stainless_v2/app/models/user_model.dart';
import 'package:stainless_v2/services/user_services.dart';

class StoreServices {
  FirebaseFirestore _firestore;
  DocumentReference _mainRef;
  Rx<StoreModel> current = Rx<StoreModel>();
  StoreServices() {
    _firestore = FirebaseFirestore.instance;
    _mainRef = _firestore.collection("user").doc(UserServices.to.user.uid);
  }
  createNewStore() {
    _mainRef.set({"store": StoreModel(gold: 0.0, sliver: 0).toJson()});
  }

  openUserStore() async {
    _mainRef.snapshots().listen((event) {
      UserModel user = UserModel.fromJson(event.data());
      current.value = StoreModel.fromJson(user.store);
    });
  }

  addImport(StoreModel newImport) async {
    _mainRef.update({
      "store": StoreModel(
              gold: current.value.gold + newImport.gold,
              sliver: current.value.sliver + newImport.sliver)
          .toJson()
    });
  }

  updateSliverValueManual(double amount) async {
    _mainRef.update({"store.sliver": amount});
  }

  updateGoldValueManual(double amount) async {
    _mainRef.update({"store.gold": amount});
  }
}
