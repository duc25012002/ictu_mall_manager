// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save_local.dart';
import 'package:http/http.dart' as http;

enum Gender { nam, nu }

class UpdateInfomationController extends GetxController {
  final name = TextEditingController();
  final address = TextEditingController();
  var dateSelected = DateTime.now().obs;
  var selectedValue = true.obs;
  var gender = Gender.nam.obs;
  String gioiTinh = '';

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    super.dispose();
  }

  Future<void> updateInformation() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    final Uri uri = Uri.parse(UPDATE_INF);
    if (selectedValue == true) {
      gioiTinh = "Nam";
    } else {
      gioiTinh = "Nữ";
    }
    print("⏱️ $dateSelected");
    final Map<String, dynamic> params = {
      'name': name.text,
      'date': dateSelected.value.toIso8601String(),
      'address': address.text,
      'gender': gioiTinh
    };

    print(uri.replace(queryParameters: params));

    final response = await http.post(
      uri.replace(queryParameters: params),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Cập nhật thông tin cá nhân thành công!');
      Get.back();
    } else {
      Fluttertoast.showToast(msg: 'Vui lòng cập nhật lại thông tin cá nhân!');
    }
  }
}
