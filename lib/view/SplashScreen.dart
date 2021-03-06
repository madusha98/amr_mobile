import 'package:amr_mobile/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(context) => Stack(
        children: [
          Scaffold(
              body: Obx(
            () => Stack(
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
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width / 2.5,
                        height: Get.width / 4,
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logodarkbg.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      controller.isLoading.value
                          ? Container(
                              height: 100,
                              width: 100,
                              // color: Colors.red,
                              child: CircularProgressIndicator())
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      );
}
