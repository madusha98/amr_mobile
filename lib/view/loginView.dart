import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/loginController.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 0.0, top: 5.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
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
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: Get.height),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, 0.0),
                      colors: [Get.theme.primaryColor, Get.theme.accentColor],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
                Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height / 4,
                        child: Text(
                          'Sign in to your account',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                ),
              ],
            ),
          ),
        ),
      );
}
