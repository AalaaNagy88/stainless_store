import 'package:get/get.dart';
import 'package:stainless_v2/app/controllers_mixins/order_controller_mixin.dart';
import 'package:stainless_v2/generated/l10n.dart';

class AddOrderController extends GetxController with OrderControllerMixin {
  RxString selectedColor = RxString();
  RxString selectedType = RxString();
  @override
  void onInit() {
    selectedColor.value = S.current.sliver;
    selectedType.value = S.current.sheets;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
