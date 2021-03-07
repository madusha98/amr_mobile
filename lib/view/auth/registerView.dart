import 'package:amr_mobile/controller/auth/registerController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(context) => AuthContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 40),
                  child: Text(
                    'Create an account.',
                    style: TextStyle(
                        color: TEXT_COLOR,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.name.value = text,
                    label: 'Your Name',
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) {
                      controller.email.value = text;
                      if (!verifyEmail(text) && text != '') {
                        controller.emailError.value =
                            'Please enter a valid email';
                      } else {
                        controller.emailError.value = '';
                      }
                    },
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    hasError: controller.emailError.value != '',
                    errorLabel: controller.emailError.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) {
                      text = '+94' + text;
                      controller.phone.value = text;
                      if (!verifyMobile(text) && text != '') {
                        controller.mobileError.value =
                            'Please enter a valid mobile number';
                      } else {
                        controller.mobileError.value = '';
                      }
                    },
                    label: 'Mobile',
                    keyboardType: TextInputType.phone,
                    hasError: controller.mobileError.value != '',
                    errorLabel: controller.mobileError.value,
                    prefix: '+94(0) ',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) {
                      controller.nic.value = text;
                      if (!verifyNic(text) && text != '') {
                        controller.nicError.value = 'Please enter a valid NIC';
                      } else {
                        controller.nicError.value = '';
                      }
                    },
                    label: 'NIC',
                    keyboardType: TextInputType.name,
                    hasError: controller.nicError.value != '',
                    errorLabel: controller.nicError.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.password.value = text,
                    label: 'Create a strong password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: OutLinedTextField(
                    onChanged: (text) {
                      controller.retypePassword.value = text;
                      var x = controller.matchPasswords(text);
                      print(x);
                    },
                    label: 'Repeat Password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: RoundedRectangleButton(
                    label: 'Create an account',
                    onPressed: controller.register,
                  ),
                  // child: ElevatedButton(
                  //   child: Text('Register'),
                  //   onPressed: controller.register,
                  // ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0),
                      child: Text(
                        'By signing up you agree to our ',
                        style: TextStyle(
                          color: TEXT_COLOR.withOpacity(0.7),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8.0),
                      child: TouchableOpacity(
                        onTap: () {
                          //
                        },
                        child: Text(
                          'Privacy Policy and Terms.',
                          style: TextStyle(
                              color: TEXT_COLOR.withOpacity(0.7),
                              fontSize: 10,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, bottom: 20.0),
                      child: Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: TEXT_COLOR,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8.0),
                      child: TouchableOpacity(
                        onTap: () {
                          Get.offNamed('/login');
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: TEXT_COLOR,
                              fontSize: 14,
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
