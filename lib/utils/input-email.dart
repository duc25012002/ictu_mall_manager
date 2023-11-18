// ignore: must_be_immutable
// ignore_for_file: must_be_immutable, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  InputEmail({
    super.key,
    required this.controller,
    required this.hint,
  });

  TextEditingController? controller;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please Input Correct Email';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(color: Colors.black),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      ),
    );
  }
}
