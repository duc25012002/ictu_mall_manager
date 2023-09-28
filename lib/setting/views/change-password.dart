// ignore_for_file: file_names, unrelated_type_equality_checks
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ictu_mall_manager/setting/controller/setting-controller.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/input-text.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class ChangedPassword extends StatefulWidget {
  const ChangedPassword({super.key});

  @override
  State<ChangedPassword> createState() => _ChangedPasswordState();
}

class _ChangedPasswordState extends State<ChangedPassword> {
  //--> variables
  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  SetingController setingController = SetingController();

  // --> dispose
  @override
  void dispose() {
    oldPassword.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      TextWidget(text: 'Cập nhật thông tin', size: 20),
                    ],
                  ),
                  const SizedBox(height: 100),
                  InputText(
                    controller: oldPassword,
                    text: 'Mật khẩu cũ',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: password,
                    text: 'Mật khẩu mới',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: passwordConfirmation,
                    text: 'Xác nhận mật khẩu',
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                      ),
                      onPressed: () async {
                        await setingController.changedPassword(oldPassword.text,
                            password.text, passwordConfirmation.text);
                      },
                      child: const Text(
                        'Xác nhận',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
