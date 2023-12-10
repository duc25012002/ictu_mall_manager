// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/constant/api.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  });
  String text;
  double size;
  Color? color = Colors.white;
  FontWeight? fontWeight = FontWeight.w500;
  String limitCharacters(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      limitCharacters(text, 20),
      style: TextStyle(
        fontSize: SizeConfig.descPx,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
