import 'package:get/get.dart';
import 'package:ictu_mall_manager/features/history/history-controller.dart';

class GetListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<GetListHistoryController>();
  }
}
