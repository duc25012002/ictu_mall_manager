import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:ictu_mall_manager/views/bindings/app_bingdings.dart';

main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.dashBoard,
    initialBinding: AppBindings(),
    getPages: getPages,
  ));
}
