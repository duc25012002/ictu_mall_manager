// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:ictu_mall_manager/controllers/setting-controller.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SetingController setingController = SetingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: SizeConfig.height! * 0.01,
              right: SizeConfig.width! * 0.01,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidget(text: 'Đăng xuất', size: SizeConfig.titlePx!),
                  IconButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.login);
                      },
                      icon: const Icon(Icons.logout, size: 20)),
                ],
              ),
            ),
            Positioned(
              top: SizeConfig.height! * 0.15,
              left: SizeConfig.width! * 0.015,
              child: Container(
                width: SizeConfig.width! * 0.45,
                height: SizeConfig.height! * 0.2,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 5.5,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.editProfile);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.perm_contact_calendar_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                      TextWidget(
                        text: 'Sửa thông tin',
                        size: SizeConfig.titlePx!,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.height! * 0.15,
              right: SizeConfig.height! * 0.015,
              child: Container(
                width: SizeConfig.width! * 0.45,
                height: SizeConfig.height! * 0.2,
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 5.5,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.changedPass),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.password,
                        size: 60,
                        color: Colors.white,
                      ),
                      TextWidget(
                        text: 'Đổi mật khẩu',
                        size: SizeConfig.titlePx!,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
