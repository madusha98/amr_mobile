import 'package:get/get.dart';
import 'package:amr_mobile/service/authService.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;
  var otp = '';
  var newPassword = '';

  final AuthService _authService = Get.find();

  void resetPassword() async {
    try {
      var res = await _authService.forgotPassword(email.value);
      if (res != null) {
        print(res);
      }
    } catch (e) {
      print(e);
    }
  }

  void confirmPassword() async {
    try {
      var res =
          await _authService.confirmPassword(email.value, newPassword, otp);
      if (res != null) {
        print(res);
      }
    } catch (e) {
      print(e);
    }
  }
}
