// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/seller/sell-screen.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/home_screen.dart';
import 'package:ictu_mall_manager/features/get_list_product/get_list_product_screen.dart';
import 'package:ictu_mall_manager/features/history/history-screen.dart';
import 'package:ictu_mall_manager/features/setting/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const GetListProductScreen(),
    const SellScreen(),
    const GetListHistoryScreen(),
    const SettingScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.sell),
        title: 'Products',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.qr_code, color: Colors.white),
        title: 'QR Scan',
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: 'History',
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: 'Setting',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.grey.shade100,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
