import 'package:amr_mobile/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  bool isLoading = false;
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    storage.initStorage.then((value) {
      print(value);
      Get.offNamed(storage.hasData('token') ? Routes.HOME : Routes.LOGIN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }
}
