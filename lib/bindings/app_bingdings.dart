// app-bindings.dart
import 'package:get/get.dart';
import 'package:ictu_mall_manager/features/authentication/auth_controller.dart';
import 'package:ictu_mall_manager/features/get_list_product/get_list_product_controller.dart';
import 'package:ictu_mall_manager/features/history/history-controller.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/home-controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ShowUserInfomationController>(ShowUserInfomationController());
    Get.put<GetListProductController>(GetListProductController());
    Get.put<GetListHistoryController>(GetListHistoryController());
  }
}
