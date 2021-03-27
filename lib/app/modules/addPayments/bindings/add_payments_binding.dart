import 'package:get/get.dart';

import '../controllers/add_payments_controller.dart';

class AddPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentsController>(
      () => AddPaymentsController(Get.arguments),
    );
  }
}
