import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/createNewPasswordController.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CreateNewPassword extends GetView<CreateNewPasswordController> {
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
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            // actions: [
            //   Container(
            //     margin: const EdgeInsets.all(5.0),
            //     color: Get.theme.primaryColor.withOpacity(0.4),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Image.asset('assets/logodarkbg.png'),
            //     ),
            //   )
            // ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: Get.height),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0, 0.0),
                  colors: [Get.theme.primaryColor, Get.theme.accentColor],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height / 4,
                    child: Text(
                      'Create a new password',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
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
                              color: Colors.white,
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
            ),
          ),
        ),
      );
}
