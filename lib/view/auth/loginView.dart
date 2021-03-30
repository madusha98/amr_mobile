import 'package:amr_mobile/controller/auth/loginController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(context) => LoadingOverlay(
        isLoading: controller.loading.value,
        child: AuthContainer(
          child: Padding(
            padding: const EdgeInsets.only(left: PADDING, right: PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height / 8.5, bottom: 20),
                  height: Get.height / 4,
                  child: Center(
                    child: Text(
                      'Sign in to your account',
                      style: Get.textTheme.headline6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: PADDING),
                  child: OutLinedTextField(
                    onChanged: (text) {
                      controller.email.value = text;
                    },
                    label: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: PADDING),
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
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: TouchableOpacity(
                        onTap: () {
                          Get.toNamed(Routes.FORGOTPASSWORD);
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
                  padding: const EdgeInsets.only(bottom: PADDING),
                  child: RoundedRectangleButton(
                    label: 'Sign In',
                    onPressed: controller.login,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, bottom: 20.0),
                      child: Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8.0),
                      child: TouchableOpacity(
                        onTap: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          'Create one',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
