import 'package:get/get.dart';
import 'package:ictu_mall_manager/features/setting/update_infomation/update_infomation_controller.dart';

class UpdateUserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UpdateInfomationController>(UpdateInfomationController());
  }
}
