import 'package:amr_mobile/domain/User.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
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
      Get.toNamed(Routes.OTP, arguments: {
        'email': email.value,
        'password': password.value,
        'prevPage': Routes.REGISTER
      });
    }
  }

  bool matchPasswords(String text) {
    if (password.value == '' || retypePassword.value == '') {
      return true;
    }
    return password.value == text;
  }

  bool verifyEmail(String text) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);

  bool verifyNic(String text) =>
      RegExp(r'^([0-9]{9}[x|X|v|V]|[0-9]{12})$').hasMatch(text);

  bool verifyMobile(String text) =>
      RegExp(r'^(?:7|0|(?:\+94))[0-9]{9,10}$').hasMatch(text);

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
}
