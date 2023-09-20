// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/authentication/model/user-model.dart';
import 'package:ictu_mall_manager/home/controller/home-controller.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeController.getUserModel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else if (snapshot.data == null) {
          return const Center(child: Text('Không có dữ liệu'));
        } else {
          UserModel userModel = snapshot.data!;
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgr.jpeg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'User Information',
                                  size: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.jpeg'),
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: userModel.name ?? 'Your name',
                                        size: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      TextWidget(
                                        text: userModel.address ?? 'Address',
                                        size: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      TextWidget(
                                        text: userModel.email ?? 'No email',
                                        size: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: MediaQuery.sizeOf(context).width - 50,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: 'Phone',
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  TextWidget(
                                    text: userModel.phone ?? 'Phone',
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
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
      },
    );
  }
}
