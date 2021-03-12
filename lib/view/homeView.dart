import 'dart:ui';
import 'package:amr_mobile/domain/BillData.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/homeController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends GetView<HomeController> {

  SfCartesianChart _getDefaultSplineChart() => SfCartesianChart(
        plotAreaBorderWidth: 0,
        //title: ChartTitle(text: 'Average high/low temperature of London'),
        //legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            labelPlacement: LabelPlacement.onTicks),
        primaryYAxis: NumericAxis(
            //minimum: 10000,
            //maximum: 1000,
            axisLine: AxisLine(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            labelFormat: 'LKR {value}',
            majorTickLines: MajorTickLines(size: 0)),
        series: _getDefaultSplineSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      );

  List<SplineSeries<BillData, String>> _getDefaultSplineSeries() {
    final chartData = <BillData>[
      BillData(
          month: 'Oct', billValue: 2496,),
      BillData(
          month: 'Nov', billValue: 3152,),
      BillData(
          month: 'Dec', billValue: 2148,),
      BillData(
          month: 'Jan', billValue: 1463.50,),
      BillData(
          month: 'Feb', billValue: 1789,),
      BillData(
          month: 'Mar', billValue: 3326,),
    ];
    return <SplineSeries<BillData, String>>[
      SplineSeries<BillData, String>(
        dataSource: chartData,
        xValueMapper: (BillData billData, _) => billData.month,
        yValueMapper: (BillData billData, _) => billData.billValue,
        color: Get.theme.accentColor,
        markerSettings: MarkerSettings(isVisible: true),
        name: 'Bill Value',
      ),
    ];
  }

  @override
  Widget build(context) =>
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Container(
                                height: Get.height * 0.62 -
                                    135 -
                                    51, //minus the height of buttons + bottom nav bar height
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: _getDefaultSplineChart(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
                                //Get.toNamed(Routes.SCAN);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text('Monthly Scan',
                                        style: TextStyle(fontSize: 17)),
                                  ]),
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
                                Get.toNamed(Routes.SUCCESS);
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
                                    Text('Quick Scan',
                                        style: TextStyle(fontSize: 17)),
                                  ]),
                            ))
                      ]),
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