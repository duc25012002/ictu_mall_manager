// home-screen-bindings.dart
import 'package:get/get.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/home_controller.dart';

class ShowUserInfomationBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<ShowUserInfomationController>();
  }
}
