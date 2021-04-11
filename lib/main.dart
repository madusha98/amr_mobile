import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/service/tfLiteService.dart';
import 'package:amr_mobile/utils/logger.dart';
import 'package:amr_mobile/utils/theme.dart';
import 'package:amr_mobile/view/home/bottomNav.dart';
import 'package:camera/camera.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras[0];
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(21, 75, 189, 1),
    ),
  );
  runApp(MyApp(
    camera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final CameraDescription camera;

  MyApp({Key key, this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetStorage());
    Get.put(AuthService());
    Get.put(HttpService());
    Get.put(FCMService());
    Get.put(TFLiteService(camera));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: Routes.SPLASH,
      // home: Nav(),
      getPages: Pages.routes,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: theme,
    );
  }
}
