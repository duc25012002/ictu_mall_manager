import 'dart:convert';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save_local.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/model/invoice.dart';

class GetListHistoryController extends GetxController {
  var isLoading = true.obs;
  var historyList = <Invoice>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('Controllear initialized');
  }

  Future<RxList<Invoice>> getListProduct() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var res = await http.post(
        Uri.parse(GET_LIST_HIS),
        headers: headers,
      );
      print(res.request);
      if (res.statusCode == 200) {
        isLoading(true);
        final List<dynamic> data = jsonDecode(res.body)['data'];
        print(data);
        historyList.value = data.map((json) => Invoice.fromJson(json)).toList();
        return historyList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (exception) {
      print(exception.toString());
      return historyList;
    }
  }
}
