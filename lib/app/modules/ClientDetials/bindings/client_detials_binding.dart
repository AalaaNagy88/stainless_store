import 'package:get/get.dart';

import '../controllers/client_detials_controller.dart';

class ClientDetialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientDetialsController>(
      () => ClientDetialsController(Get.arguments),
    );
  }
}
