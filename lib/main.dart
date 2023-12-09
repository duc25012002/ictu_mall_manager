import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ictu_mall_manager/routes/routes.dart';
import 'package:ictu_mall_manager/bindings/app_bingdings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

main() async {
  await GetStorage.init();
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.editProfile,
      initialBinding: AppBindings(),
      getPages: getPages,
    ));
    print('🌍 [ĐÃ KẾT NỐI VỚI LOÀI NGƯỜI]');
  } else {
    print('Please connect your internet and restart your application!');
  }
}
