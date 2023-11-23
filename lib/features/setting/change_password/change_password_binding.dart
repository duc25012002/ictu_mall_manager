import 'package:get/get.dart';
import 'package:ictu_mall_manager/features/setting/change_password/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
