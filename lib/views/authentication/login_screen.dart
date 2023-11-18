// login-screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/views/authentication/auth_controller.dart';
import 'package:ictu_mall_manager/utils/input-email.dart';
import 'package:ictu_mall_manager/utils/input-password.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends GetView<AuthController> {
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Lottie.asset('assets/images/logo_login_animation.json'),
              TextWidget(
                text: 'ICTU MALL MANAGER',
                size: SizeConfig.titlePx! * 1.5,
                color: AppColor.mainColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.width! * 0.05),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InputEmail(
                        controller: controller.emailController,
                        hint: 'Email',
                      ),
                      const SizedBox(height: 20),
                      InputPassword(
                        passwordController: controller.passwordController,
                        isObsecured: controller.isObsecured,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: SizeConfig.width! * 0.9,
                height: SizeConfig.height! * 0.05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.loginController(
                          controller.emailController.text,
                          controller.passwordController.text);
                    }
                  },
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                        color: Colors.white, fontSize: SizeConfig.titlePx!),
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
