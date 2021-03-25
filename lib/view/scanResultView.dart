import 'dart:ui';
import 'package:amr_mobile/controller/scanResultController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanResult extends GetView<ScanResultController> {
  @override
  Widget build(context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Get.theme.primaryColor, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: BACKGROUND_COLOR,
        body: Obx(
          () => controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(
                      left: PADDING, right: PADDING, bottom: 40.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                            padding:
                                const EdgeInsets.only(top: 100.0, bottom: 30.0),
                            child: Container(
                                width: Get.width,
                                height: Get.height -
                                    135 -
                                    51 -
                                    60, //minus the height of buttons + bottom nav bar height + top padding
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.image != null
                                        ? Image.file(controller.image)
                                        : Container(),
                                    Text(
                                      'Your scan result is,',
                                      style: Get.textTheme.headline6.apply(
                                          color: Get.theme.primaryColor
                                              .withOpacity(0.8)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: PADDING * 1.5),
                                      child: Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment(0, 0.0),
                                            colors: [
                                              Colors.black.withOpacity(0.6),
                                              Colors.black
                                            ],
                                            tileMode: TileMode.clamp,
                                          ),
                                        ),
                                        child: Obx(
                                          () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                for (var digit
                                                    in controller.digits)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
                                                      height: 50,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end:
                                                              Alignment(0, 0.0),
                                                          colors: [
                                                            Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                            Colors.white
                                                          ],
                                                          tileMode:
                                                              TileMode.clamp,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(digit,
                                                            style: TextStyle(
                                                                fontSize: 32,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                  ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80.0),
                                      child: Text(
                                        'Please check above scanned result with your electricity meter and confirm.\nIf values don\'t match please rescan.',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 14),
                                      ),
                                    )
                                  ],
                                ))),
                      ),
                      Column(children: [
                        Container(
                            height: 55,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: PADDING),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Get.theme.primaryColor),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )),
                              onPressed: () {
                                Get.toNamed(Routes.SUCCESS);
                              },
                              child: Text('Confirm',
                                  style: TextStyle(fontSize: 17)),
                            )),
                        Container(
                            height: 55,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 0, right: 0),
                            child: OutlineButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {
                                Get.offNamed(Routes.SCAN);
                              },
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor,
                                  width: 2,
                                  style: BorderStyle.solid),
                              textColor: Get.theme.primaryColor,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Get.theme.primaryColor,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text('Rescan',
                                        style: TextStyle(fontSize: 17)),
                                  ]),
                            ))
                      ]),
                    ],
                  ),
                ),
        ),
      );
}
