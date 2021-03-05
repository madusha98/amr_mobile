import 'package:amr_mobile/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(context) => Stack(
        children: [
          Scaffold(
              body: Obx(
            () => Container(
                  constraints: BoxConstraints(minHeight: Get.height),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logodarkbg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Container(),
                ),
          )),
        ],
      );
}
