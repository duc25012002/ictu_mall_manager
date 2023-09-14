import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  const TitleInput({
    super.key,
    required this.textInput,
  });

  final String textInput;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 13 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.5 * ffem / fem,
          color: const Color(0xff282829),
        ),
        children: [
          TextSpan(
            text: textInput,
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              fontSize: 13 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.5 * ffem / fem,
              color: const Color(0xfff3472f),
            ),
          ),
        ],
      ),
    );
  }
}
