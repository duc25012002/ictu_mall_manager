// ignore_for_file: file_names

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/model/product.dart';

class ProductController {
  Future<List<Product>> getListProduct() async {
    SaveLocal saveLocal = SaveLocal();

    getTokenInLocal() async {
      var token = await saveLocal.readDataToLocal('token');
      return token;
    }

    try {
      var token = await getTokenInLocal();
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      var res = await http.get(
        Uri.parse(GET_LIST_PRO),
        headers: headers,
      );
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body)['data'];

        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (exception) {
      print(exception.toString());
      Fluttertoast.showToast(msg: 'Không lấy được danh sách hàng hoá');
      throw Exception('Failed to load products');
    }
  }
}
