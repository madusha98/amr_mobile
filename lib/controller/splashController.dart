import 'package:amr_mobile/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    storage.initStorage.then((value) {
      print(value);
      isLoading.value = false;
      Get.offNamed(storage.hasData('token') ? Routes.HOME : Routes.LOGIN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }
}
