import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/setting/update_infomation/update_infomation_controller.dart';
import 'package:ictu_mall_manager/utils/input_text.dart';
import 'package:ictu_mall_manager/utils/text_widget.dart';

class EditProfileScreen extends GetView<UpdateInfomationController> {
  const EditProfileScreen({Key? key}) : super(key: key);

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
                controller: controller.name,
                text: 'Tên người dùng',
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ngày Sinh', style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        maxDateTime: DateTime.now(),
                        initialDateTime: DateTime.utc(2002, 01, 25),
                        dateFormat: "dd-MMM-yyyy",
                        locale: DATETIME_PICKER_LOCALE_DEFAULT,
                        pickerMode: DateTimePickerMode.date,
                        onChange: (dateTime, selectedIndex) {
                          controller.dateSelected.value = dateTime;
                          controller.update();
                        },
                        onConfirm: (dateTime, selectedIndex) {
                          controller.dateSelected.value = dateTime;
                          controller.update();
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      width: SizeConfig.width! / 1.8,
                      height: 50,
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${controller.dateSelected.value}'.substring(0, 10),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              InputText(
                controller: controller.address,
                text: 'Địa chỉ',
              ),
              const SizedBox(height: 30),
              Obx(
                () => Column(
                  children: [
                    RadioListTile(
                      title: const Text('Nam', style: TextStyle(fontSize: 16)),
                      value: Gender.nam,
                      activeColor: Colors.blue,
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value as Gender;
                        controller.selectedValue.value = true;
                      },
                    ),
                    RadioListTile(
                      title: const Text('Nữ', style: TextStyle(fontSize: 16)),
                      value: Gender.nu,
                      groupValue: controller.gender.value,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        controller.gender.value = value as Gender;
                        controller.selectedValue.value = false;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
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
