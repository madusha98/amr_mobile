import 'package:amr_mobile/bindings/homeBinding.dart';
import 'package:amr_mobile/bindings/loginBinding.dart';
import 'package:amr_mobile/bindings/splash_binding.dart';
import 'package:amr_mobile/view/homeView.dart';
import 'package:amr_mobile/view/loginView.dart';
import 'package:amr_mobile/view/SplashScreen.dart';
import 'package:get/get.dart';

part 'routes.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    )
  ];
}
