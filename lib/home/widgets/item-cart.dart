// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/utils/app-color.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
    required this.userString,
    required this.text,
  });

  final String userString;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              TextWidget(
                text: text,
                size: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: userString,
                size: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
