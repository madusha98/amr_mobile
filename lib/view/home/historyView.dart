import 'dart:ui';
import 'package:amr_mobile/controller/home/historyController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends GetView<HistoryController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            // extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Get.theme.primaryColor, //change your color here
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'History',
                style: TextStyle(
                    fontSize: 22,
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              bottom: TabBar(
                // isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Monthly Scan',
                  ),
                  Tab(
                    text: 'Quick Scan',
                  ),
                  Tab(
                    text: 'Past Bills',
                  ),
                ],
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
            backgroundColor: BACKGROUND_COLOR,
            body: TabBarView(
              children: [
                // ******** 1st tab ********
                Padding(
                  padding: const EdgeInsets.only(top: PADDING, bottom: PADDING),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      height: 65,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: PADDING),
                                  child: Text(
                                    'January 2021',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: PADDING),
                                  child: Text(
                                    'Units: 150 kWh',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, left: PADDING),
                                  child: Text(
                                    'Scanned Date: 28.02.2021 02:28 PM',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, right: PADDING),
                                  child: Text(
                                    'Success',
                                    style: TextStyle(
                                        color: Color.fromRGBO(6, 209, 26, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 10,
                        shadowColor: Colors.black.withOpacity(0.26),
                      ),
                    ),
                  ),
                ),
                // ******** 2nd tab ********
                Padding(
                  padding: const EdgeInsets.only(top: PADDING, bottom: PADDING),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      height: 65,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: PADDING),
                                  child: Text(
                                    'Usage: 150 kWh',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, left: PADDING),
                                  child: Text(
                                    'Scanned Date: 28.02.2021 02:28 PM',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 10,
                        shadowColor: Colors.black.withOpacity(0.26),
                      ),
                    ),
                  ),
                ),
                // ******** 3rd tab ********
                Padding(
                  padding: const EdgeInsets.only(top: PADDING, bottom: PADDING),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      height: 65,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: PADDING),
                                  child: Text(
                                    'Bill Value: 1500.00 LKR',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: PADDING),
                                  child: Text(
                                    'Units: 150 kWh',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, left: PADDING),
                                  child: Text(
                                    'January 2021',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, right: PADDING),
                                  child: Text(
                                    'PAID',
                                    style: TextStyle(
                                        color: Color.fromRGBO(6, 209, 26, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 10,
                        shadowColor: Colors.black.withOpacity(0.26),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
