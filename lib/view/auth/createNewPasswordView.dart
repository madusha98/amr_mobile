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
        child: Padding(
          padding: const EdgeInsets.only(left: PADDING, right: PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100, bottom: 50),
                child: Text(
                  'Create a new password',
                  style: Get.textTheme.headline6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: PADDING),
                    child: TouchableOpacity(
                      child: Text(
                        'Choose a strong password',
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
                child: OutLinedTextField(
                  onChanged: (text) {
                    controller.newpassword.value = text;
                  },
                  label: 'Password',
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: PADDING * 2),
                child: OutLinedTextField(
                  onChanged: (text) {
                    controller.confirmpassword.value = text;
                  },
                  label: 'Repeat Password',
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: PADDING),
                child: RoundedRectangleButton(
                  label: 'Sign In',
                  onPressed: controller.confirmPassword,
                ),
              ),
            ],
          ),
        ),
      );
}
