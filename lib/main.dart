import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ictu_mall_manager/routes/routes.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: getPages,
    );
  }
}
