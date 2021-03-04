import 'package:amr_mobile/domain/User.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/widgets/otpBottomSheet.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = 'madushalakruwan2nd@gmail.com'.obs;
  var password = ''.obs;
  var retypePassword = ''.obs;
  var name = 'Madusha Lakruwan'.obs;
  var phone = '+94716584458'.obs;
  var nic = '982000000V'.obs;
  var otp = '';

  final AuthService _authService = Get.find();

  void register() async {
    var user = User(
        email: email.value,
        password: password.value,
        name: name.value,
        phone: phone.value,
        nic: nic.value);
    print(user.toAwsJson);
    var res = await _authService.signup(user);
    if (res != null) {
      Get.toNamed(Routes.OTP,
          arguments: {'email': email.value, 'password': password.value});
    }
  }

  bool matchPasswords(String text) {
    if (password.value == '' || retypePassword.value == '') {
      return true;
    }
    return password.value == text;
  }

  void confirmOtp() async {
    var res = await _authService.confirmSignUp(email.value, otp);
    if (res != null && res.isSignUpComplete) {
      await login();
    }
  }

  void login() async {
    var loggedIn = await _authService.login(email.value, password.value);
    if (loggedIn) {
      _authService.fetchSession().then((value) {
        Get.offAllNamed(Routes.SPLASH);
      });
    }
  }

  void resendOtp() async {
    await _authService.resendCode(email.value);
  }

  void showOtpBottomSheet() {
    Get.bottomSheet(OtpBottomSheet(
      onChangedText: (text) => otp = text,
      resendOtp: resendOtp,
      confirmOtp: confirmOtp,
    ));
  }
}
