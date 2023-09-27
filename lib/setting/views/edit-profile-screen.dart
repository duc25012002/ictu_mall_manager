// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/authentication/widgets/input-text.dart';
import 'package:ictu_mall_manager/setting/controller/setting-controller.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gender = TextEditingController();
  SetingController setingController = SetingController();
  @override
  void dispose() {
    name.dispose();
    date.dispose();
    address.dispose();
    gender.dispose();
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
                    controller: name,
                    text: 'User\'s Name',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: date,
                    text: 'Date Of Birth',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: address,
                    text: 'Address',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: gender,
                    text: 'Gender',
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
                        await setingController.updateInformation(
                            name.text, date.text, address.text, gender.text);
                      },
                      child: const Text(
                        'Confirm',
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
