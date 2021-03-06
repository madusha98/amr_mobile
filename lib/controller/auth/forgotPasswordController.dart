import 'package:amr_mobile/routes/pages.dart';
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
        Get.toNamed(Routes.OTP, arguments: {
          'email': email.value,
          'prevPage': Routes.FORGOTPASSWORD
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
