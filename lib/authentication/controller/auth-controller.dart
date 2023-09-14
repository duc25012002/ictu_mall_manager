// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ictu_mall_manager/api/api.dart';
import 'package:ictu_mall_manager/authentication/model/user-model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthController {
  var log = Logger();
  UserModel userModel = UserModel();
  Future<void> loginController(String email, String password) async {
    try {
      userModel = UserModel(email: email, password: password);
      var res = await http.post(
        Uri.parse(API.loginAPI),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userModel),
      );
      print(json.encode(userModel));

      if (res.statusCode == 200) {
        Get.snackbar('IMM', 'Đăng nhập thành công');
      } else {
        Get.snackbar('IMM', 'Sai tên đăng nhập hoặc mật khẩu');
      }
    } catch (exception) {
      log.e("", error: exception.toString());
    }
  }
}
