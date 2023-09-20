// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/authentication/widgets/input-text.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  String? phone;

  TextEditingController productCode = TextEditingController();
  TextEditingController nameProduct = TextEditingController();
  TextEditingController numberProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  CroppedFile? image;
  var isObsecured = true.obs;
  @override
  void dispose() {
    productCode.dispose();
    nameProduct.dispose();
    numberProduct.dispose();
    priceProduct.dispose();
    super.dispose();
  }

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      final cropper = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 500,
        maxHeight: 500,
        compressFormat: ImageCompressFormat.png,
      );
      setState(() {
        image = cropper;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextWidget(
                    text: '- - Add Product - -',
                    size: 25,
                    color: AppColor.mainColor,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        print('aaaaa');
                        getImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                        width: 500,
                        height: 500,
                        child: image != null
                            ? Image.file(File(image!.path))
                            : Image.asset('assets/images/avatar.jpeg'),
                      )),
                  const SizedBox(height: 50),
                  Container(
                      width: MediaQuery.sizeOf(context).width - 10,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(1, 1.5),
                            blurRadius: 5.5,
                          )
                        ],
                      ),
                      child: Center(
                          child: TextWidget(
                        text: phone ?? 'Click on Picture Choose Your Image',
                        size: 20,
                      ))),
                  const SizedBox(height: 50),
                  InputText(
                    controller: productCode,
                    text: 'Input Product\'s Code',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: nameProduct,
                    text: 'Input Product\'s Name',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: numberProduct,
                    text: 'Input Product\'s Number',
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    controller: priceProduct,
                    text: 'Input Product\'s Price',
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
                        //...
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
