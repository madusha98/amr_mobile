import 'package:amr_mobile/controller/registerController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 50),
                  child: Container(
                    child: Text(
                      'Create an account.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.name.value = text,
                    label: 'Your Name',
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.email.value = text,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.phone.value = text,
                    label: 'Mobile',
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.nic.value = text,
                    label: 'NIC',
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutLinedTextField(
                    onChanged: (text) => controller.password.value = text,
                    label: 'Create a strong password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedRectangleButton(
                    label: 'Create an account',
                    onPressed: controller.register,
                  ),
                  // child: ElevatedButton(
                  //   child: Text('Register'),
                  //   onPressed: controller.register,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TouchableOpacity(
                    child: Text(
                      'By signing up you agree to our Privacy Policy and Terms.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
