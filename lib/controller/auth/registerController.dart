import 'package:amr_mobile/domain/Request/User.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = 'madushalakruwan2nd@gmail.com'.obs;
  var password = ''.obs;
  var retypePassword = ''.obs;
  var name = 'Madusha Lakruwan'.obs;
  var phone = '+94716584458'.obs;
  var nic = '982000000V'.obs;
  var otp = '';

  var emailError = ''.obs;
  var mobileError = ''.obs;
  var nicError = ''.obs;

  var loading = false.obs;

  final AuthService _authService = Get.find();
  final FCMService _fcmService = Get.find();

  void register() async {
    loading.value = true;
    var user = User(
        email: email.value,
        password: password.value,
        name: name.value,
        phone: phone.value,
        nic: nic.value);
    print(user.toAwsJson);
    var res = await _authService.signup(user);
    loading.value = false;
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
        _fcmService.updateToken();
        Get.offAllNamed(Routes.SPLASH);
      });
    }
  }

  void resendOtp() async {
    await _authService.resendCode(email.value);
  }
}
