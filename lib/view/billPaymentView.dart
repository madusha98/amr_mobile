import 'dart:ui';
import 'package:amr_mobile/controller/billPaymentController.dart';
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
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: BACKGROUND_COLOR,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: PADDING, top: PADDING * 1.2, right: PADDING),
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
                  padding: const EdgeInsets.only(
                      left: PADDING, top: 5.0, right: PADDING),
                  child: Obx(
                    () => TextField(
                      controller: controller.amountTextField.value,
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: PADDING, top: PADDING * 3, bottom: PADDING),
                      child: Text(
                        'Last 5 payments',
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: PADDING * 3, right: PADDING, bottom: PADDING),
                      child: TouchableOpacity(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Get.theme.accentColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: Get.height / 2.5,
                    //color: Colors.yellow,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        height: 65,
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: PADDING),
                                    child: Text(
                                      'January',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: PADDING),
                                    child: Text(
                                      '2,687.50',
                                      style: TextStyle(
                                        fontSize: 16,
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: PADDING, top: PADDING * 2, right: PADDING),
                      child: Text(
                        'You\'re paying to the account number #1234567890',
                        style: TextStyle(
                          fontSize: 14,
                          color: Get.theme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PADDING, top: PADDING * 1.5, right: PADDING),
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
                        onPressed: () {
                          controller.pay();
                        },
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
                ]),
              ],
            ),
          ),
        ),
      );
}
