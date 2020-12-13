import 'package:amr_mobile/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GetStorage storage = GetStorage();

  Duration get loginTime => Duration(milliseconds: 2250);

  void login() {
    storage.write('token', 'token');
    print(storage.read('token'));
    Get.offNamed(Routes.SPLASH);
  }
}
