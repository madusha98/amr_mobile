import 'package:amr_mobile/controller/auth/createNewPasswordController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CreateNewPassword extends GetView<CreateNewPasswordController> {
  @override
  Widget build(context) => AuthContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 50),
              child: Text(
                'Create a new password',
                style: TextStyle(
                  fontSize: 24,
                  color: TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TouchableOpacity(
                    child: Text(
                      'Choose a strong password',
                      style: TextStyle(
                        color: TEXT_COLOR,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutLinedTextField(
                onChanged: (text) {
                  controller.newpassword.value = text;
                },
                label: 'Password',
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutLinedTextField(
                onChanged: (text) {
                  controller.confirmpassword.value = text;
                },
                label: 'Repeat Password',
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedRectangleButton(
                label: 'Sign In',
                onPressed: controller.confirmPassword,
              ),
            ),
          ],
        ),
      );
}
