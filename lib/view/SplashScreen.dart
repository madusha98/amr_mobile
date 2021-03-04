import 'package:amr_mobile/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(context) => Scaffold(
          body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? CircularProgressIndicator()
              : Container(),
        ),
      ));
}
