import 'package:amr_mobile/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: controller.isLoading ? CircularProgressIndicator() : Container(),
      ),
    );
  }
}
