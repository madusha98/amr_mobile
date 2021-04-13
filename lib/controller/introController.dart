import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_slider/slide_object.dart';

class IntroController extends GetxController {
  List<Slide> slides = [];
  GetStorage storage = Get.find();

  @override
  void onInit() {
    super.onInit();
    slides.add(
      Slide(
        title: 'Getting Started',
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),
        styleDescription: TextStyle(color: Colors.white, fontSize: 14.0),
        centerWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: PADDING, right: PADDING, bottom: PADDING*2),
              child: Text('A very smart way to scan your electricity meter.',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                  textAlign: TextAlign.center),
            ),
            Image.asset(
              'assets/slider1.png',
              height: 350.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
        colorBegin: Get.theme.primaryColor,
        colorEnd: Get.theme.accentColor,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      Slide(
        centerWidget: Container(
          transform: Matrix4.translationValues(0.0, -100.0, 0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: PADDING, right: PADDING, bottom: PADDING*2),
                child: Text('No more late bills,\nNo more inaccurate bills,\nScan & View the Bill Instantly',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center),
              ),
              Image.asset(
                'assets/slider2.png',
                height: 380.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        colorBegin: Get.theme.primaryColor,
        colorEnd: Get.theme.accentColor,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      Slide(
        centerWidget: Container(
          transform: Matrix4.translationValues(0.0, -100.0, 0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: PADDING, right: PADDING, bottom: PADDING*2),
                child: Text('Manage your past bills,\nPay your bills\n& receive notifications for next scan.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center),
              ),
              Image.asset(
                'assets/slider3.png',
                height: 400.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        colorBegin: Get.theme.primaryColor,
        colorEnd: Get.theme.accentColor,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
  }

  void onDonePressed() {
    storage.write(StorageKeys.IS_FIRST_TIME, 'true');
    Get.offNamed(Routes.WELCOME);
  }
}
