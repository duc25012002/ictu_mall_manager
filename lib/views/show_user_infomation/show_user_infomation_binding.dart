// home-screen-bindings.dart
import 'package:get/get.dart';
import 'package:ictu_mall_manager/views/show_user_infomation/home-controller.dart';

class ShowUserInfomationBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<ShowUserInfomationController>();
  }
}
