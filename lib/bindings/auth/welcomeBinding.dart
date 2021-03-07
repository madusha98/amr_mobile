import 'package:amr_mobile/controller/auth/registerController.dart';
import 'package:amr_mobile/controller/auth/welcomeController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
