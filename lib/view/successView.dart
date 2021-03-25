import 'dart:ui';
import 'package:amr_mobile/controller/successController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends GetView<SuccessController> {
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
                            135 -
                            51 -
                            60, //minus the height of buttons + bottom nav bar height + top padding
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/success.png',
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: PADDING * 2, bottom: PADDING),
                              child: Text(
                                'Success!',
                                style: Get.textTheme.headline6.apply(
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.8)),
                              ),
                            ),
                            Text(
                              'Your electricity bill value for the\nperiod 01/01/2021 - 28/02/2021 is',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: PADDING / 2),
                              child: Text(
                                'LKR 2,867.60',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
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
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Get.theme.primaryColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      onPressed: () {
                        Get.toNamed(Routes.BILLPAYMENT);
                      },
                      child:
                          Text('Go to Payment', style: TextStyle(fontSize: 17)),
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
                        // Get.toNamed(Routes.HOME);
                      },
                      borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                          width: 2,
                          style: BorderStyle.solid),
                      textColor: Get.theme.primaryColor,
                      child: Text('Close', style: TextStyle(fontSize: 17)),
                    ))
              ]),
            ],
          ),
        ),
      );
}
