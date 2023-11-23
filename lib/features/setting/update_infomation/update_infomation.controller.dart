import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/setting/update_infomation/update_infomation_controller.dart';
import 'package:ictu_mall_manager/utils/input-text.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class EditProfileScreen extends GetView<UpdateInfomationController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                controller: controller.name,
                text: 'Tên người dùng',
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.date,
                text: 'Ngày sinh',
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.address,
                text: 'Địa chỉ',
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.gender,
                text: 'Giới tính',
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
                    await controller.updateInformation();
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
