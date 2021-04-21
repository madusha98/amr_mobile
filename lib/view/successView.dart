import 'dart:ui';
import 'package:amr_mobile/controller/home/bottomNavController.dart';
import 'package:amr_mobile/controller/successController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

final List<String> imgList = [
  'assets/tip1.png',
  'assets/tip2.png',
  'assets/tip3.png',
  'assets/tip4.png',
  'assets/tip5.png'
];

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
              left: PADDING, right: PADDING, bottom: PADDING),
          child: Obx(
            () => controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: PADDING * 2, bottom: PADDING),
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
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: PADDING, bottom: PADDING),
                                      child: Text(
                                        'Success!',
                                        style: Get.textTheme.headline6.apply(
                                            color: Get.theme.primaryColor
                                                .withOpacity(0.8)),
                                      ),
                                    ),
                                    Text(
                                      'Your electricity bill value for the\nperiod ${controller.fromdate.value.replaceAll('-', '/')} - ${controller.todate.value.replaceAll('-', '/')} is',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 14),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: PADDING / 2),
                                      child: Obx(
                                        () => Text(
                                          'LKR ' + controller.amount.value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '\n(No of kWh units consumed:  ${controller.noOfUnits.value})',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 14),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: PADDING * 2),
                                      child: Text(
                                        'Here are some tips to reduce your next month bill :',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Get.theme.accentColor,
                                            fontSize: 13),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: PADDING),
                                      child: Container(
                                          height: 95.0,
                                          width: Get.width,
                                          color: Colors.transparent,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                            ),
                                            items: imgList
                                                .map((item) => Container(
                                                      height: 120,
                                                      color: Colors.transparent,
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    3, 0, 3, 0),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    Image.asset(
                                                                  item,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                  height: 120,
                                                                  width: 240,
                                                                )),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8.0)),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .green,
                                                                    blurRadius:
                                                                        3.0,
                                                                    spreadRadius:
                                                                        2.0,
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )),
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
                                controller.gotoBillPayments();
                              },
                              child: Text('Go to Payment',
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
                                // Get.toNamed(Routes.HOME);
                                Get.offAllNamed(Routes.HOME);
                              },
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor,
                                  width: 2,
                                  style: BorderStyle.solid),
                              textColor: Get.theme.primaryColor,
                              child:
                                  Text('Close', style: TextStyle(fontSize: 17)),
                            ))
                      ]),
                    ],
                  ),
          ),
        ),
      );
}
