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
    switch (Get.arguments['prevPage']) {
      case Routes.REGISTER:
        confirmSignUp(text);
        break;
      case Routes.FORGOTPASSWORD:
        Get.toNamed(Routes.CREATENEWPASSWORD,
            arguments: {'otp': text, 'email': Get.arguments['email']});
        break;
    }
  }

  void confirmSignUp(String otp) async {
    var res = await _authService.confirmSignUp(Get.arguments['email'], otp);
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
