// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/show_user_infomation/home-controller.dart';

class HomeScreen extends GetView<ShowUserInfomationController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: controller.getUserModel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else if (snapshot.data == null) {
          return const Center(child: Text('Không có dữ liệu'));
        } else {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: SizeConfig.height! * 0.01,
                    right: SizeConfig.height! * 0.02,
                    child: CircleAvatar(
                      child: Image.network(
                        snapshot.data!.value!.avatar ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.height! * 0.02,
                    right: SizeConfig.height! * 0.08,
                    child: Text(
                      snapshot.data!.value!.name ?? '',
                      style: TextStyle(fontSize: SizeConfig.titlePx),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.height! * 0.01,
                    left: SizeConfig.height! * 0.02,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.qr_code),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.height! * 0.1,
                    child: Container(
                      width: SizeConfig.width! - 10,
                      height: SizeConfig.height! * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/images/bgr.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: SizeConfig.height! * 0.055,
                            left: SizeConfig.width! * 0.05,
                            child: Text(
                              snapshot.data!.value!.name ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.titlePx! * 1.5),
                            ),
                          ),
                          Positioned(
                            top: SizeConfig.height! * 0.1,
                            left: SizeConfig.width! * 0.05,
                            child: Text(
                              snapshot.data!.value!.email ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.descPx),
                            ),
                          ),
                          Positioned(
                            bottom: SizeConfig.height! * 0.03,
                            right: SizeConfig.width! * 0.05,
                            child: Text(
                              snapshot.data!.value!.phone ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.descPx),
                            ),
                          ),
                          Positioned(
                            bottom: SizeConfig.height! * 0.07,
                            right: SizeConfig.width! * 0.05,
                            child: Text(
                              snapshot.data!.value!.address ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.descPx),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
