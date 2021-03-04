import 'package:amr_mobile/routes/pages.dart';
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.email.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.password.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Login'),
                      onPressed: controller.login,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Register'),
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
