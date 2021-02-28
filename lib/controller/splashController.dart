import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  GetStorage storage = GetStorage();
  final FCMService _fcmService = FCMService();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    storage.initStorage.then((value) {
      print(value);
      isLoading.value = false;
      Get.offNamed(storage.hasData('token') ? Routes.HOME : Routes.LOGIN);
    });
    _fcmService.handleNotifications();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
