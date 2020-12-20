import 'package:amr_mobile/controller/registerController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
