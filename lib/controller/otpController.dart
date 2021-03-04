import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var otp = ''.obs;

  final AuthService _authService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void confirmOtp(String text) async {
    print(otp.value);
    var res = await _authService.confirmSignUp(Get.arguments['email'], text);
    if (res != null && res.isSignUpComplete) {
      await login();
    }
  }

  void login() async {
    var loggedIn = await _authService.login(
        Get.arguments['email'], Get.arguments['password']);
    if (loggedIn) {
      _authService.fetchSession().then((value) {
        Get.offAllNamed(Routes.SPLASH);
      });
    }
  }
}
