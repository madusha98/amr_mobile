import 'dart:ui';
import 'package:amr_mobile/controller/generateController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Generate extends GetView<GenerateController> {
  @override
  Widget build(context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        backgroundColor: BACKGROUND_COLOR,
        body: Padding(
          padding: const EdgeInsets.only(
              left: PADDING, right: PADDING, bottom: 40.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
                    child: Container(
                        height: Get.height -
                            100 -
                            51 -
                            60, //minus the height of buttons, bottom nav bar height, top padding
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: PADDING * 2, bottom: PADDING * 4),
                                //loading
                                child: SpinKitRing(
                                  color: Colors.blue,
                                )),
                            Text('Generating the bill',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blueAccent,
                                )),
                            Text('Bare with us...',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.7),
                                ))
                          ],
                        ))),
              ),
            ],
          ),
        ),
      );
}
