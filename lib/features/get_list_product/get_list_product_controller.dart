import 'dart:convert';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/model/product.dart';

class GetListProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('Controller initialized');
  }

  Future<RxList<Product>> getListProduct() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var res = await http.get(
        Uri.parse(GET_LIST_PRO),
        headers: headers,
      );
      if (res.statusCode == 200) {
        isLoading(true);
        final List<dynamic> data = jsonDecode(res.body)['data'];
        print(data);
        productList.value = data.map((json) => Product.fromJson(json)).toList();
        return productList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (exception) {
      print(exception.toString());
      return productList;
    }
  }
}
