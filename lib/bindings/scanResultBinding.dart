import 'package:amr_mobile/controller/scanResultController.dart';
import 'package:get/get.dart';

class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanResultController());
  }
}
