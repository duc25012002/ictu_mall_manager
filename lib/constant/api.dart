// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class API {
  static const IMM = 'https://humorous-accepted-eagle.ngrok-free.app';
  static const loginAPI = '$IMM/api/login';
  static const getUserInfomation = '$IMM/api/information';
  static const getListProductAPI = '$IMM/api/product';
  static const postBarCode = '$IMM/api/xuat-kho/them-san-pham';
  static const updateInfomation = '$IMM/api/information/update';
  static const changedPassword = '$IMM/api/information/change-password';
  static const getDataHistory = '$IMM/api/sale-history';
}

abstract class AppColor {
  static const mainColor = Color.fromARGB(255, 1, 115, 187);
  static const iconColor = Color.fromARGB(255, 74, 211, 123);
}
