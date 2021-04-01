import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  GetStorage storage = Get.find();
  final FCMService _fcmService = FCMService();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 100), () {
      if (storage.hasData(StorageKeys.IS_FIRST_TIME)) {
        isLoading.value = false;
        Get.offNamed(
          storage.hasData(StorageKeys.TOKEN) ? Routes.HOME : Routes.LOGIN,
        );
      } else {
        isLoading.value = false;
        Get.offNamed(Routes.INTRO);
      }
    });

    _fcmService.handleNotifications();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
