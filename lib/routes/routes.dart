// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ictu_mall_manager/views/authentication/login_screen.dart';
import 'package:ictu_mall_manager/views/authentication/login_screen_bindings.dart';
import 'package:ictu_mall_manager/views/dash-board/dash-board-screen.dart';
import 'package:ictu_mall_manager/views/change-password.dart';
import 'package:ictu_mall_manager/views/edit-profile-screen.dart';
import 'package:ictu_mall_manager/views/show_user_infomation/home_screen.dart';
import 'package:ictu_mall_manager/views/show_user_infomation/show_user_infomation_binding.dart';

class Routes {
  static String dashBoard = '/dashBoard';
  static String login = '/login';
  static String homeScreen = '/homeScreen';
  static String editProfile = '/editProfile';
  static String changedPass = '/changedPass';
}

final getPages = [
  GetPage(name: Routes.dashBoard, page: () => DashBoardScreen()),
  GetPage(
    name: Routes.login,
    page: () => LoginScreen(),
    binding: LoginScreenBindings(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => HomeScreen(),
    binding: ShowUserInfomationBindings(),
  ),
  GetPage(name: Routes.editProfile, page: () => EditProfileScreen()),
  GetPage(name: Routes.changedPass, page: () => ChangedPassword()),
];
