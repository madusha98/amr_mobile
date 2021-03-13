import 'package:amr_mobile/controller/generateController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class GenerateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenerateController());
  }
}
