import 'package:amr_mobile/controller/scanBillPayController.dart';
import 'package:get/get.dart';

class ScanBillPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanBillPayController());
  }
}
