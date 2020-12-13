import 'package:amr_mobile/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  GetStorage storage = GetStorage();

  void logout() {
    storage.remove('token');
    print(storage.read('token'));
    Get.offNamed(Routes.SPLASH);
  }
}
