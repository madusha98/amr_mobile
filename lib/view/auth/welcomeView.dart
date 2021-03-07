import 'package:amr_mobile/controller/auth/welcomeController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends GetView<WelcomeController>{
  @override
  Widget build(context) => AuthContainer(
    appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        child: Padding(
          padding: const EdgeInsets.only(left: PADDING, right: PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height / 10, bottom: 20),
                height: Get.height / 4,
                child: Center(
                  child: Text(
                    'Start by creating\naccount.',
                    style: Get.textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height / 18, bottom: 20),
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logodarkbg.png'),
                        fit: BoxFit.contain),
                  ),
          ),
          Padding(
                padding: const EdgeInsets.only(top: 100, bottom:PADDING),
                child: RoundedRectangleButton(
                  label: 'Create an account',
                  onPressed: () {
                        Get.toNamed('/register');
                      },
                ),
              ),
          Padding(
                padding: const EdgeInsets.only(bottom:PADDING),
                child: Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: (){Get.toNamed('/login');},
        borderSide: BorderSide(
            color: Colors.white,
            width: 2,
            style: BorderStyle.solid
        ),
        textColor: Colors.white,
        child: Text('Sign In', style: TextStyle(fontSize: 17)),
      ))
              ),
        ]),
      )
    );
}