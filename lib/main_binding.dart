import 'package:get/get.dart';
import 'package:stainless_v2/services/user_services.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserServices());
  }
}
