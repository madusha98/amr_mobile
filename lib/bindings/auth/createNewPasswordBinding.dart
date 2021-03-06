import 'package:amr_mobile/controller/auth/createNewPasswordController.dart';
import 'package:get/get.dart';

class CreateNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewPasswordController());
  }
}
