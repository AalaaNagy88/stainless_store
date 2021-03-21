import 'package:get/get.dart';

import 'package:stainless_v2/app/modules/AppNavigation/bindings/app_navigation_binding.dart';
import 'package:stainless_v2/app/modules/AppNavigation/views/app_navigation_view.dart';
import 'package:stainless_v2/app/modules/ClientDetials/bindings/client_detials_binding.dart';
import 'package:stainless_v2/app/modules/ClientDetials/views/client_detials_view.dart';
import 'package:stainless_v2/app/modules/addOrder/bindings/add_order_binding.dart';
import 'package:stainless_v2/app/modules/addOrder/views/add_order_view.dart';
import 'package:stainless_v2/app/modules/clients/bindings/clients_binding.dart';
import 'package:stainless_v2/app/modules/clients/views/clients_view.dart';
import 'package:stainless_v2/app/modules/home/bindings/home_binding.dart';
import 'package:stainless_v2/app/modules/home/views/home_view.dart';
import 'package:stainless_v2/app/modules/payments/bindings/payments_binding.dart';
import 'package:stainless_v2/app/modules/payments/views/payments_view.dart';
import 'package:stainless_v2/app/modules/profile/bindings/profile_binding.dart';
import 'package:stainless_v2/app/modules/profile/views/profile_view.dart';
import 'package:stainless_v2/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:stainless_v2/app/modules/signUp/views/sign_up_view.dart';
import 'package:stainless_v2/app/modules/splash/bindings/splash_binding.dart';
import 'package:stainless_v2/app/modules/splash/views/splash_view.dart';
import 'package:stainless_v2/app/modules/store/bindings/store_binding.dart';
import 'package:stainless_v2/app/modules/store/views/store_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final navigationRoutes = [
    routes[5],
    routes[0],
    routes[3],
    routes[4],
  ];
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.APP_NAVIGATION,
      page: () => AppNavigationView(),
      binding: AppNavigationBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTS,
      page: () => ClientsView(),
      binding: ClientsBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => StoreView(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTS,
      page: () => PaymentsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_DETIALS,
      page: () => ClientDetialsView(),
      binding: ClientDetialsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ORDER,
      page: () => AddOrderView(),
      binding: AddOrderBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
