import 'package:get/get.dart';

import '../controllers/edit_order_controller.dart';

class EditOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditOrderController>(
      () => EditOrderController(Get.arguments),
    );
  }
}
