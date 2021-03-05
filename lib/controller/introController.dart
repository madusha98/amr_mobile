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
    // TODO: implement onInit
    super.onInit();
    slides.add(
      Slide(
        title: 'ERASER',
        description:
            'Allow miles wound place the leave had. To sitting subject no improve studied limited',
        //pathImage: 'images/photo_eraser.png',
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      Slide(
        title: 'PENCIL',
        description:
            'Ye indulgence unreserved connection alteration appearance',
        //pathImage: 'images/photo_pencil.png',
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: 'RULER',
        description:
            'Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of',
        //pathImage: 'images/photo_ruler.png',
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePressed() {
    storage.write(StorageKeys.IS_FIRST_TIME, 'true');
    Get.offNamed(Routes.LOGIN);
  }
}
