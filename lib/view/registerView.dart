import 'package:amr_mobile/controller/registerController.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 5.0, top: 5.0),
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {Get.back();},
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(5.0),
                color: Get.theme.primaryColor.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/logodarkbg.png'),
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
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
                    padding: const EdgeInsets.only(top: 100, bottom: 40),
                    child: Text(
                      'Create an account.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: OutLinedTextField(
                      onChanged: (text) => controller.name.value = text,
                      label: 'Your Name',
                      keyboardType: TextInputType.name,
                      hasError: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: OutLinedTextField(
                      onChanged: (text) {
                        controller.email.value = text;
                        var validEmail = controller.verifyEmail(text);
                        print(validEmail);
                      },
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: OutLinedTextField(
                      onChanged: (text) {
                        controller.phone.value = text;
                        var validMobile = controller.verifyMobile(text);
                        print(validMobile);
                      },
                      label: 'Mobile',
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: OutLinedTextField(
                      onChanged: (text) {
                        controller.nic.value = text;
                        var validNic = controller.verifyNic(text);
                        print(validNic);
                      },
                      label: 'NIC',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: OutLinedTextField(
                      onChanged: (text) => controller.password.value = text,
                      label: 'Create a strong password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
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
                    padding: const EdgeInsets.only(top:12.0),
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
                            color: Colors.white.withOpacity(0.7),
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
                                color: Colors.white.withOpacity(0.7),
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
                            color: Colors.white,
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
                                color: Colors.white,
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
        ),
      );
}
