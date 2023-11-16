// ignore_for_file: file_names, unused_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/constant/api.dart';

class SellController {
  Future<void> fetchData(String searchTerm) async {
    final Uri uri = Uri.parse(API.postBarCode);
    final Map<String, String> params = {'maSanPham': searchTerm};

    print(uri.replace(queryParameters: params));
    final response = await http.get(uri.replace(queryParameters: params));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Thành công');
    } else {
      Fluttertoast.showToast(msg: 'Lỗi kết nối với Server');
      throw Exception('Failed to load data');
    }
  }
}
