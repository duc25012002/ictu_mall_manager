// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save_local.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  Future<void> changedPassword() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    final Uri uri = Uri.parse(CHANGED_PASS);
    final Map<String, String> params = {
      'old_password': oldPasswordController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmationController.text,
    };
    if (passwordController.text
            .toLowerCase()
            .contains(RegExp(r'[!@#%^&*(),.?":{}|<>]')) &&
        passwordConfirmationController.text == passwordController.text) {
      final response = await http.post(
        uri.replace(queryParameters: params),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Cập nhật mật khẩu thành công!');
        Get.back();
      } else {
        Fluttertoast.showToast(msg: 'Vui lòng cập nhật lại mật khẩu!');
      }
    } else {
      Fluttertoast.showToast(
        msg:
            "Mật khẩu phải chứ ký tự !@#%^&*(),.?\":{}|<>\nMật khẩu xác nhận phải giống mật khẩu cập nhật!",
        timeInSecForIosWeb: 3,
      );
    }
  }
}
