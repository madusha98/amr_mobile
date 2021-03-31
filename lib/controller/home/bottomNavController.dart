import 'package:amr_mobile/routes/pages.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  void navigateToTab(int tabIndex) {
    this.tabIndex.value = tabIndex;
    Get.offAllNamed(Routes.HOME);
  }
}
