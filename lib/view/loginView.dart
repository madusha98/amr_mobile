import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/loginController.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      // child: FlutterLogin(
      //   title: 'AMR',
      //   titleTag: 'title',
      //   // logo: 'assets/images/ecorp-lightblue.png',
      //   onLogin: controller.login,
      //   onSignup: controller.signup,
      //   onSubmitAnimationCompleted: () {
      //     Get.offNamed(Routes.HOME);
      //   },
      //   onRecoverPassword: controller.recoverPassword,
      // ),
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Login'),
            onPressed: controller.login,
          ),
        ),
      ),
    );
  }
}
