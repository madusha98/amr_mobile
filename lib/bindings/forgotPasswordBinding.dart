import 'package:amr_mobile/controller/forgotPasswordController.dart';
import 'package:get/get.dart';

class forgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => forgotPasswordController());
  }
}
