import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HttpService());
    Get.put(AuthService());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: Routes.SPLASH,
      getPages: Pages.routes,
    );
  }
}
