// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(text: 'Logout', size: 15),
                      IconButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.login);
                          },
                          icon: const Icon(Icons.logout, size: 18)),
                    ],
                  ),
                  const SizedBox(height: 150),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/bgr.jpeg'),
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    text: 'Email',
                    size: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColor.mainColor,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(0.5, 0.5),
                          blurRadius: 5.5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              //...
                              Get.toNamed(Routes.editProfile);
                            },
                            child: TextWidget(
                              text: 'Change Infomation',
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(0.5, 0.5),
                          blurRadius: 5.5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              //...
                              Get.toNamed(Routes.changedPass);
                            },
                            child: TextWidget(
                              text: 'Change Password',
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
