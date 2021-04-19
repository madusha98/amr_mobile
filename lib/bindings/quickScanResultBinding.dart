import 'package:amr_mobile/controller/quickScanResultController.dart';
import 'package:get/get.dart';

class QuickScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuickScanResultsController());
  }
}
