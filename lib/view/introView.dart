import 'package:amr_mobile/controller/introController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';

class Intro extends GetView<IntroController> {
  @override
  Widget build(context) => Scaffold(
        body: IntroSlider(
          colorActiveDot: Colors.white,
          slides: controller.slides,
          onDonePress: controller.onDonePressed,
        ),
      );
}
