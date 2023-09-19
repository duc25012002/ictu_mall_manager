// ignore_for_file: file_names

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/api/api.dart';
import 'package:ictu_mall_manager/authentication/model/user-model.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:logger/logger.dart';

class AuthController {
  var log = Logger();
  UserModel userModel = UserModel();
  SaveLocal saveLocal = SaveLocal();

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
        var resData = jsonDecode(res.body);
        print(res.body);
        await saveLocal.writeDataToLocal(
          'token',
          resData['data']['access_token'],
        );
        Fluttertoast.showToast(msg: 'Đăng nhập thành công');
        Get.offAllNamed(Routes.dashBoard);
      } else {
        print(res.body);
        Fluttertoast.showToast(msg: 'Đăng nhập thành công');
      }
    } catch (exception) {
      log.w("", error: exception.toString());
    }
  }
}
