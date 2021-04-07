import 'package:get/get.dart';
import 'package:stainless_v2/app/models/client_model.dart';
import 'package:stainless_v2/firebase_services/client_services.dart';

class HomeController extends GetxController {
  ClientServices _clientServices = ClientServices();
  List<ClientModel> get clients => _clientServices.clients.value;
  double get totalBalance => clients.fold(
      0, (previousValue, element) => element.remains + previousValue);
  List<double> get monthSales => calcMonthSales();
  RxBool showBalance = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _clientServices.loadAllClients();
    super.onReady();
  }

  @override
  void onClose() {}
  List<double> calcMonthSales() {
    List<double> monthSales = List.filled(12, 0.0);
    for (var i = 0; i < 12; i++) {
      for (ClientModel client in clients) {
        monthSales[i] += client.orders.fold(
            0,
            (previousValue, element) => element.createdAt.month == i + 1
                ? element.totalPrice + previousValue
                : 0);
      }
      monthSales[i] /= 1000;
    }
    return monthSales;
  }
}
