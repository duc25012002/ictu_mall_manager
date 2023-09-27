// ignore_for_file: file_names
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/api/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';

class SetingController {
  SaveLocal saveLocal = SaveLocal();

  getUserToken() async {
    var token = await saveLocal.readDataToLocal('token');
    print('Bearer $token');
    return token;
  }

  Future<void> updateInformation(
      String name, String date, String address, String gender) async {
    var token = await getUserToken();
    print('jsdbjabjdsbjbjadb😂sj tokennnnnnn $token');
    final Uri uri = Uri.parse(API.updateInfomation);
    final Map<String, String> params = {
      'name': name,
      'date': date,
      'address': address,
      'gender': gender
    };

    print(uri.replace(queryParameters: params));

    final response = await http.post(
      uri.replace(queryParameters: params),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Cập nhật thông tin cá nhân thành công.');
    } else {
      Fluttertoast.showToast(msg: 'Vui lòng cập nhật lại thông tin cá nhân.');
      throw Exception('Failed to update information');
    }
  }

  Future<void> changedPassword(
      String oldPassword, String password, String passwordConfirmation) async {
    var token = await getUserToken();
    print('jsdbjabjdsbjbjadb😂sj tokennnnnnn $token');

    final Uri uri = Uri.parse(API.updateInfomation);
    final Map<String, String> params = {
      'old_password': oldPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    print(uri.replace(queryParameters: params));

    final response = await http.post(
      uri.replace(queryParameters: params),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Cập nhật mật khẩu thành công.');
    } else {
      Fluttertoast.showToast(msg: 'Vui lòng cập nhật lại mật khẩu.');
      throw Exception('Failed to update information');
    }
  }
}
