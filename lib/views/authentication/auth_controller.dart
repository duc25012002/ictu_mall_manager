// auth-controller.dart
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/model/user-model.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  Logger log = Logger();
  Rx<UserModel> userModel = UserModel().obs;
  SaveLocal saveLocal = SaveLocal();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isObsecured = true.obs;
  
  Future<void> loginController(String email, String password) async {
    try {
      userModel.value = UserModel(email: email, password: password);

      var res = await http.post(
        Uri.parse(LOGIN_API),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userModel.value),
      );
      print(json.encode(userModel.value));

      if (res.statusCode == 200) {
        var resData = jsonDecode(res.body);
        print(res.body);
        await saveLocal.writeDataToLocal(
            'token', resData['data']['access_token']);
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
