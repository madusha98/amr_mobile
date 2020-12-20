import 'package:get/get.dart';
import 'package:amr_mobile/controller/splashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
