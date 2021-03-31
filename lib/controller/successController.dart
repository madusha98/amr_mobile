import 'package:amr_mobile/controller/home/bottomNavController.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  void gotoBillPayments() {
    BottomNavController bottomNavController = Get.find();
    bottomNavController.navigateToTab(2);
  }
}
