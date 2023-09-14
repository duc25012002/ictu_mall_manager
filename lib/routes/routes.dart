// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ictu_mall_manager/authentication/views/login-screen.dart';
import 'package:ictu_mall_manager/dash-board/dash-board-screen.dart';

class Routes {
  static String dashBoard = '/dashBoard';
  static String login = '/login';
}

final getPages = [
  GetPage(name: Routes.dashBoard, page: () => DashBoardScreen()),
  GetPage(name: Routes.login, page: () => LoginScreen()),
];
