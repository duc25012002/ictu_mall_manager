// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/setting/change_password/change_password_controller.dart';
import 'package:ictu_mall_manager/utils/input-text.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class ChangedPassword extends GetView<ChangePasswordController> {
  const ChangedPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  TextWidget(text: 'Cập nhật thông tin', size: 20),
                ],
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.oldPasswordController,
                text: 'Mật khẩu cũ',
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.passwordController,
                text: 'Mật khẩu mới',
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.passwordConfirmationController,
                text: 'Xác nhận mật khẩu',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  onPressed: () async {
                    await controller.changedPassword();
                  },
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
