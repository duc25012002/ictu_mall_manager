import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:ictu_mall_manager/bindings/app_bingdings.dart';

main() async {
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login,
    initialBinding: AppBindings(),
    getPages: getPages,
  ));
}
