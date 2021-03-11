import 'dart:ui';
import 'package:amr_mobile/domain/BillData.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/homeController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends GetView<HomeController> {
  List<BillData> data = [
    BillData({'Jan', 35}),
    BillData({'Feb', 28}),
    BillData({'Mar', 34}),
    BillData({'Apr', 32}),
    BillData({'May', 40})
  ];

  List<double> chartData = <double>[10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10];

  @override
  Widget build(context) =>
      // Scaffold(
      //       appBar: AppBar(
      //         title: Hero(tag: 'title', child: Text('AMR')),
      //       ),
      //       body: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Obx(() => controller.loading.value
      //                 ? CircularProgressIndicator()
      //                 : Text(controller.testMsg.value)),
      //             RaisedButton(child: Text('Logout'), onPressed: controller.logout),
      //           ],
      //         ),
      //       ),
      //     );

      Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Container(
              margin: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/logodarkbg.png'),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: Get.height * 0.28 + 22,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, 0.75),
                  colors: [Get.theme.primaryColor, Get.theme.accentColor],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: PADDING),
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -7.5, 0.0),
                    child: Text(
                      'Hi Michael,',
                      style: Get.textTheme.headline6,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: Get.height * 0.72 - 51,
                decoration: BoxDecoration(
                  color: BACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: PADDING, right: PADDING, bottom: 10.0),
                  child: Column(children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Container(
                                height: Get.height * 0.62 - 135 - 51, //minus the height of buttons + bottom nav bar height
                                child: 
                                Column(
                                  children: [
                                    Expanded(
                                      child: SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          // Chart title
                                          //title: ChartTitle(text: 'Half yearly sales analysis'),
                                          // Enable legend
                                          //legend: Legend(isVisible: true),
                                          // Enable tooltip
                                          tooltipBehavior: TooltipBehavior(enable: true),
                                          series: <ChartSeries<BillData, String>>[
                                            SplineSeries<BillData, String>(
                                              splineType: SplineType.cardinal,
                                                dataSource: data,
                                                xValueMapper: (BillData billData, _) => billData.month,
                                                yValueMapper: (BillData billData, _) => billData.value,
                                                name: 'Bills',
                                                color: Get.theme.accentColor,
                                                // Enable data label
                                                dataLabelSettings: DataLabelSettings( isVisible: true)
                                                )
                                          ]
                                        ),
                                    ),
                                  ],
                                ),
                              )
                            )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            height: 55,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: PADDING),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Get.theme.primaryColor),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )),
                              onPressed: () {},
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text('Monthly Scan',
                                        style: TextStyle(fontSize: 17)),
                                  ]),
                            )
                            ),
                            Container(
                        height: 55,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 0, right: 0),
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () {},
                          borderSide: BorderSide(
                              color: Get.theme.primaryColor,
                              width: 2,
                              style: BorderStyle.solid),
                          textColor: Get.theme.primaryColor,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Get.theme.primaryColor,
                                    size: 20.0,
                                  ),
                                ),
                                Text('Quick Scan',
                                    style: TextStyle(fontSize: 17)),
                              ]),
                        ))
                  ]
                  ),
                      ],
                    ),
                    
                ),
              )),
          Positioned(
              top: Get.height * 0.28 - 51,
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width - PADDING * 2,
                margin: EdgeInsets.symmetric(horizontal: PADDING),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 20)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 11.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Last Scanned',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(165, 165, 165, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Apr',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.5)),
                              ),
                            ),
                            Text(
                              '30th',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Get.theme.primaryColor),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Last Bill Value',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(165, 165, 165, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'LKR',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.5)),
                              ),
                            ),
                            Text(
                              '3,467.00',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Get.theme.primaryColor),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Next Scan Due',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(165, 165, 165, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'May',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.5)),
                              ),
                            ),
                            Text(
                              '31st',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Get.theme.primaryColor),
                            )
                          ],
                        )
                      ]),
                ),
              ))
        ]),
      );
}
