import 'package:amr_mobile/controller/auth/loginController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:touchable_opacity/touchable_opacity.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(context) => AuthContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height / 5, bottom: 20),
              height: Get.height / 4,
              child: Center(
                child: Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutLinedTextField(
                onChanged: (text) {
                  controller.email.value = text;
                },
                label: 'Email',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutLinedTextField(
                onChanged: (text) {
                  controller.password.value = text;
                },
                label: 'Password',
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TouchableOpacity(
                    onTap: () {
                      Get.toNamed('/forgotPassword');
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedRectangleButton(
                label: 'Sign In',
                onPressed: controller.login,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedRectangleButton(
                label: 'Register',
                onPressed: () => Get.toNamed(Routes.REGISTER),
              ),
            ),
          ],
        ),
      );
}
