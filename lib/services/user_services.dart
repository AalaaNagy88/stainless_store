import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserServices extends GetxService {
  static UserServices get to => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  User get user => auth.currentUser;
}