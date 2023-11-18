import 'package:get/get.dart';
import 'get_list_product_controller.dart';

class GetListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<GetListProductController>();
  }
}
