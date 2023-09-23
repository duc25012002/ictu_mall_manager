// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/authentication/model/user-model.dart';
import 'package:ictu_mall_manager/home/controller/home-controller.dart';
import 'package:ictu_mall_manager/home/widgets/item-cart.dart';
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
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgr.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 200),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(userModel
                                              .avatar !=
                                          null
                                      ? userModel.avatar!
                                      : 'https://plus.unsplash.com/premium_photo-1689530775582-83b8abdb5020?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3408&q=80'),
                                ),
                                const SizedBox(width: 30),
                                TextWidget(
                                  text: 'Hello, ',
                                  size: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextWidget(
                                  text: userModel.name ?? 'Your Name',
                                  size: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(width: 30),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ItemCart(
                      userString: userModel.name ?? 'Your Name',
                      text: 'User\'s name: '),
                  SizedBox(height: 20),
                  ItemCart(
                      userString: userModel.email ?? 'No Email',
                      text: 'Email: '),
                  SizedBox(height: 20),
                  ItemCart(
                      userString: userModel.address ?? 'Your Address',
                      text: 'Address: '),
                  SizedBox(height: 20),
                  ItemCart(
                      userString: userModel.phone ?? 'No Phone',
                      text: 'Phone: '),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
