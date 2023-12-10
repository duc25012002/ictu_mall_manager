// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ictu_mall_manager/features/authentication/login_screen.dart';
import 'package:ictu_mall_manager/features/authentication/login_screen_bindings.dart';
import 'package:ictu_mall_manager/features/dash_board/dash_board_screen.dart';
import 'package:ictu_mall_manager/features/get_list_product/get_list_product_binding.dart';
import 'package:ictu_mall_manager/features/get_list_product/get_list_product_screen.dart';
import 'package:ictu_mall_manager/features/history/history_screen.dart';
import 'package:ictu_mall_manager/features/setting/change_password/change_password_binding.dart';
import 'package:ictu_mall_manager/features/setting/change_password/change_password_screen.dart';
import 'package:ictu_mall_manager/features/setting/update_infomation/update_infomation_screen.dart';
import 'package:ictu_mall_manager/features/setting/update_infomation/update_infomation_binding.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/home_screen.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/show_user_infomation_binding.dart';

class Routes {
  static String dashBoard = '/dashBoard';
  static String login = '/login';
  static String homeScreen = '/homeScreen';
  static String editProfile = '/editProfile';
  static String changedPass = '/changedPass';
  static String getListProduct = '/getListProduct';
  static String getListHistory = '/getListHistory';
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
  GetPage(
    name: Routes.getListProduct,
    page: () => GetListProductScreen(),
    binding: GetListProductBinding(),
  ),
  GetPage(
    name: Routes.getListHistory,
    page: () => GetListHistoryScreen(),
    binding: GetListProductBinding(),
  ),
  GetPage(
      name: Routes.editProfile,
      page: () => EditProfileScreen(),
      binding: UpdateUserInfoBinding()),
  GetPage(
      name: Routes.changedPass,
      page: () => ChangedPasswordScreen(),
      binding: ChangePasswordBinding()),
];
