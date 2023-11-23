import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:http/http.dart' as http;

class UpdateInfomationController extends GetxController {
  final name = TextEditingController();
  final date = TextEditingController();
  final address = TextEditingController();
  final gender = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    date.dispose();
    address.dispose();
    gender.dispose();
    super.dispose();
  }

  Future<void> updateInformation() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    final Uri uri = Uri.parse(UPDATE_INF);
    final Map<String, String> params = {
      'name': name.text,
      'date': date.text,
      'address': address.text,
      'gender': gender.text
    };

    print(uri.replace(queryParameters: params));

    final response = await http.post(
      uri.replace(queryParameters: params),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Cập nhật thông tin cá nhân thành công.');
    } else {
      Fluttertoast.showToast(msg: 'Vui lòng cập nhật lại thông tin cá nhân.');
    }
  }
}
