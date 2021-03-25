import 'dart:ui';
import 'package:amr_mobile/controller/home/billPaymentController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class BillPayment extends GetView<BillPaymentController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Get.theme.primaryColor, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Bill Payment',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: BACKGROUND_COLOR,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: PADDING, right: PADDING),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: PADDING),
                      child: Text(
                        'Amount (LKR)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PADDING),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28.0, color: Colors.black),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          symbol: '',
                        )
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.5)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.2)),
                        ),
                        hintText: '0.00',
                        hintStyle: TextStyle(
                          fontSize: 28,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: PADDING, bottom: PADDING),
                        child: Text(
                          'Last 5 payments',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: PADDING, bottom: PADDING),
                        child: TouchableOpacity(
                          onTap: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.height / 2.2,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        height: Get.height / 11,
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 9, left: PADDING),
                                    child: Text(
                                      'January',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 9, right: PADDING),
                                    child: Text(
                                      '2687.50',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3, left: PADDING),
                                    child: Text(
                                      '28.02.2021 02:28 PM',
                                      style: TextStyle(
                                        fontSize: 10,
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
                                        fontSize: 10,
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
                          elevation: 3,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: PADDING),
                      child: Text(
                        'You\'re paying to the account number #1234567890',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PADDING),
                    child: Container(
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
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Proceed to Pay',
                                style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
