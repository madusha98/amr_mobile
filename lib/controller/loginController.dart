import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  final AuthService _authService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    var loggedIn = await _authService.login(email.value, password.value);
    if (loggedIn) {
      _authService.fetchSession().then((value) {
        Get.offNamed(Routes.SPLASH);
      });
    }
  }
}
