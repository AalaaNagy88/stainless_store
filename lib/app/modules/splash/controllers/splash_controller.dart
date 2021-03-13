import 'package:get/get.dart';
import 'package:stainless_v2/app/routes/app_pages.dart';
import 'package:stainless_v2/services/user_services.dart';

class SplashController extends GetxController {
  Future<Object> initFunction() async {
    return UserServices.to.user == null
        ? Routes.SIGN_UP
        : Routes.APP_NAVIGATION;
  }
}
