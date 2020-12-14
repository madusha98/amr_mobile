import 'package:amr_mobile/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/loginController.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: FlutterLogin(
        title: 'AMR',
        titleTag: 'title',
        // logo: 'assets/images/ecorp-lightblue.png',
        onLogin: controller.login,
        onSignup: controller.signup,
        onSubmitAnimationCompleted: () {
          Get.offNamed(Routes.SPLASH);
        },
        onRecoverPassword: controller.recoverPassword,
      ),
    );
  }
}
