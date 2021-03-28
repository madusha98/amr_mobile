import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  final AuthService _authService = Get.find();
  final FCMService _fcmService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    var loggedIn = await _authService.login(email.value, password.value);
    if (loggedIn) {
      _authService.fetchSession().then((value) {
        _fcmService.updateToken();
        Get.offNamed(Routes.SPLASH);
      });
    }
  }
}
