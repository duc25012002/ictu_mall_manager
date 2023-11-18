// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/model/user-model.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:http/http.dart' as http;

class ShowUserInfomationController extends GetxController {
  SaveLocal saveLocal = SaveLocal();
  Rx<UserModel?> userModel = Rx<UserModel?>(null);

  getUserToken() async {
    var token = await saveLocal.readDataToLocal('token');
    print('Bearer $token');
    return token;
  }

  Future<Rx<UserModel?>> getUserModel() async {
    var token = await getUserToken();
    try {
      var res = await http.post(Uri.parse(GET_USER_INF), headers: {
        'Authorization': 'Bearer $token',
      });
      if (res.statusCode == 200) {
        print('${res.statusCode}😂');
        var resUserInfomation = jsonDecode(res.body);

        userModel.value = UserModel(
          name: resUserInfomation['data']['name'],
          email: resUserInfomation['data']['email'],
          address: resUserInfomation['data']['dia_chi'],
          gender: resUserInfomation['data']['gioi_tinh'],
          role: resUserInfomation['data']['role_id'],
          avatar: resUserInfomation['data']['avatar'],
          phone: resUserInfomation['data']['sdt'],
        );
        await saveLocal.writeDataToLocal('email', userModel.value!.email!);
      } else {
        print('${res.statusCode}');
      }
    } catch (exception) {
      print(exception.toString());
    }
    return userModel;
  }
}
