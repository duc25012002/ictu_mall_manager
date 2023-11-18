// app-bindings.dart
import 'package:get/get.dart';
import 'package:ictu_mall_manager/views/authentication/auth_controller.dart';
import 'package:ictu_mall_manager/views/show_user_infomation/home-controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ShowUserInfomationController>(ShowUserInfomationController());
  }
}
