import 'package:amr_mobile/controller/forgotPasswordController.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: Get.height),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, 0.0),
                  colors: [Get.theme.primaryColor, Get.theme.accentColor],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: Get.height / 1.7,
                        padding: const EdgeInsets.only(
                            left: 0.0, top: 45.0, right: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: TouchableOpacity(
                                    onTap: () {
                                      Get.toNamed('/login');
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 26.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0, bottom: 15.0),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutLinedTextField(
                                    onChanged: (text) =>
                                        controller.email.value = text,
                                    label: 'Your Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
            ),
          ),
        ),
      );
}
