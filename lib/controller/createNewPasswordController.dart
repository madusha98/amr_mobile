import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  var newpassword = ''.obs;
  var confirmpassword = ''.obs;

  final AuthService _authService = Get.find();

  Null get password => null;

  @override
  void onInit() {
    super.onInit();
  }

  void createNewPassword() async {
    try {
      var res = await _authService.createNewPassword(
          newpassword.value, confirmpassword.value);
      if (res != null) {
        print(res);
      }
    } catch (e) {
      print(e);
    }
  }

  void confirmPassword() async {
    try {
      var res = await _authService.confirmPassword(
          Get.arguments['email'], confirmpassword.value, Get.arguments['otp']);
      if (res != null) {
        print(res);
        Get.offNamed(Routes.LOGIN);
      }
    } catch (e) {
      print(e);
    }
  }
}
