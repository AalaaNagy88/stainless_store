import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/models/client_model.dart';

mixin SearchControllerMixin on GetxController {
  final search = TextEditingController();
  String get querySearch => search.text;
  List<ClientModel> suggestedList = [];
  RxBool matching = false.obs;
  RxBool focus = false.obs;
  FocusNode searchFocusNode;

  @override
  void onReady() {
    searchFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(Get.overlayContext).requestFocus(searchFocusNode);
    });
    super.onReady();
  }

  startSearch(List<ClientModel> clients) {
    focus.value = true;
    if (querySearch.isEmpty) {
      matching.value = false;
      focus.value = false;
      suggestedList.clear();
    } else {
      clients.forEach((element) {
        if (element.name.contains(querySearch)) {
          matching.value = true;
          suggestedList.add(element);
          suggestedList.toSet();
        }
      });
    }
  }

  endSearch() {
    search.clear();
    searchFocusNode.unfocus();
    focus.value = false;
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
