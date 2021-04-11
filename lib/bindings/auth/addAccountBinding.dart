import 'package:amr_mobile/controller/auth/addAccountController.dart';
import 'package:get/get.dart';

class AddAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAccountController());
  }
}
