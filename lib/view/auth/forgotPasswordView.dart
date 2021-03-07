import 'package:amr_mobile/controller/auth/forgotPasswordController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) => AuthContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 45.0, right: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 22,
                                color: TEXT_COLOR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 10.0, bottom: 15.0),
                            child: Text(
                              'Enter your email below and we will send you a reset email.',
                              style: TextStyle(
                                fontSize: 15,
                                color: TEXT_COLOR.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: OutLinedTextField(
                              onChanged: (text) =>
                                  controller.email.value = text,
                              label: 'Your Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: RoundedRectangleButton(
                                label: 'Submit',
                                onPressed: controller.resetPassword),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
