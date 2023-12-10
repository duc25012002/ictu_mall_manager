// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const IMM = 'https://humorous-accepted-eagle.ngrok-free.app';
const LOGIN_API = '$IMM/api/login';
const GET_USER_INF = '$IMM/api/information';
const GET_LIST_PRO = '$IMM/api/product';
const POST_BAR_CODE = '$IMM/api/xuat-kho/them-san-pham';
const UPDATE_INF = '$IMM/api/information/update';
const CHANGED_PASS = '$IMM/api/information/change-password';
const GET_LIST_HIS = '$IMM/api/sale-history';
const GET_ID_ADD_PRODUCT = '$IMM/api/nhap-kho/tao-phieu/lay-phien-nhap';
const POST_BAR_CODE_ADD_PRODUCT = '$IMM/api/nhap-kho/tao-phieu/qr-nhap';

abstract class AppColor {
  static const mainColor = Color.fromARGB(255, 1, 115, 187);
  static const iconColor = Color.fromARGB(255, 74, 211, 123);
}

// ---size config---
class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? width;
  static double? height;
  static double? titlePx;
  static double? descPx;
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData!.size.width;
    height = mediaQueryData!.size.height;
    titlePx = width! * .04;
    descPx = height! * .02;
  }
}
