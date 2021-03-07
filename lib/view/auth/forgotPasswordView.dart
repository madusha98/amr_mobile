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
                      const EdgeInsets.only(left: PADDING, top: PADDING*3, right: PADDING),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: PADDING, bottom: PADDING),
                            child: Text(
                              'Forgot password?',
                              style: Get.textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 10.0, bottom: PADDING*2),
                            child: Text(
                              'Enter your email below and we will send you a reset email.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: PADDING*2),
                            child: OutLinedTextField(
                              onChanged: (text) =>
                                  controller.email.value = text,
                              label: 'Your Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          RoundedRectangleButton(
                              label: 'Submit',
                              onPressed: controller.resetPassword)
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
