import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/store_model.dart';
import 'package:stainless_v2/firebase_services/store_services.dart';
import 'package:stainless_v2/utils/_export.dart';

class StoreController extends GetxController {
  final gold = TextEditingController();
  final sliver = TextEditingController();
  double get goldValue => gold.text.convertToDouble();
  double get sliverValue => sliver.text.convertToDouble();
  StoreServices _storeServices = StoreServices();
  StoreModel get currentStock => _storeServices.current.value;

  @override
  void onInit() {
    _storeServices.openUserStore();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    gold.dispose();
    sliver.dispose();
  }

  addNewImport() async {
    _storeServices.addImport(StoreModel(gold: goldValue, sliver: sliverValue));
    truncateController();
    Get.back();
  }

  updateSliverAmountManual() async {
    await _storeServices.updateSliverValueManual(sliverValue);
    truncateController();
    Get.back();
  }

  updateGoldAmountManual() async {
    _storeServices.updateGoldValueManual(goldValue);
    truncateController();
    Get.back();
  }

  truncateController() {
    gold.text = "";
    sliver.text = "";
  }
}
