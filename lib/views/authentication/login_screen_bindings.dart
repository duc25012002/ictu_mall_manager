import 'package:get/get.dart';
import 'package:ictu_mall_manager/views/authentication/auth_controller.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<AuthController>();
  }
}
