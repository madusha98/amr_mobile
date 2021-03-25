import 'package:amr_mobile/controller/home/billPaymentController.dart';
import 'package:get/get.dart';

class BillPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillPaymentController());
  }
}
