// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/home/views/home-screen.dart';
import 'package:ictu_mall_manager/product/views/product-list-screen.dart';
import 'package:ictu_mall_manager/sell/views/sell-screen.dart';
import 'package:ictu_mall_manager/setting/views/setting-screen.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/warehouse/views/warehouse-screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    ProductListScreen(),
    SellScreen(),
    WarehouseScreen(),
    SettingScreen(),
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
        icon: const Icon(Icons.production_quantity_limits_rounded),
        title: 'Products',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.qr_code, color: Colors.white),
        title: 'QR Sell',
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.house_siding_rounded),
        title: 'Ware house',
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
