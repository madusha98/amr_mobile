import 'package:amr_mobile/controller/splashController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(context) => AuthContainer(
        loading: false,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        child: Container(
          height: Get.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width / 2.5,
                  height: Get.width / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logodarkbg.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                controller.isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          backgroundColor: TEXT_COLOR,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
}
