import 'package:amr_mobile/controller/auth/addAccountController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/outlineTextField.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AddAccounnt extends GetView<AddAccountController> {
  @override
  Widget build(BuildContext context) => Obx(
        () => AuthContainer(
          loading: controller.loading.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 0.0, top: 100.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: PADDING, right: PADDING),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Account',
                                  style: Get.textTheme.headline6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: PADDING),
                                  child: Text(
                                    'You should add your electricity account details to continue using this app.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: PADDING * 2, bottom: PADDING),
                                  child: OutLinedTextField(
                                    onChanged: (text) {
                                      if (text == '' || text.length < 10) {
                                        controller.accountNoError.value =
                                            'Please enter a valid account number';
                                      } else {
                                        controller.accountNoError.value = '';
                                      }
                                      controller.accountNo.value = text;
                                    },
                                    label: 'Electricity Account Number',
                                    keyboardType: TextInputType.number,
                                    hasError:
                                        controller.accountNoError.value != '',
                                    errorLabel: controller.accountNoError.value,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: PADDING),
                                  child: OutLinedTextField(
                                    onChanged: (text) {
                                      if (text == '') {
                                        controller.accountNameError.value =
                                            'Please enter a account name';
                                      } else {
                                        controller.accountNameError.value = '';
                                      }
                                      controller.accountName.value = text;
                                    },
                                    label: 'Account Name ex. (My Home)',
                                    keyboardType: TextInputType.name,
                                    hasError:
                                        controller.accountNameError.value != '',
                                    errorLabel:
                                        controller.accountNameError.value,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: PADDING),
                                  child: OutLinedTextField(
                                    maxLength: 5,
                                    onChanged: (text) {
                                      controller.lastReading.value = text;
                                    },
                                    label: 'Last Month Meter Reading',
                                    keyboardType: TextInputType.number,
                                    hasError:
                                        controller.accountNameError.value != '',
                                    errorLabel:
                                        controller.accountNameError.value,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: PADDING),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: TEXT_COLOR, width: 1.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(children: [
                                        Expanded(
                                          child: TouchableOpacity(
                                            onTap: () {
                                              controller.selectDate(context);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Last bill date : ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: TEXT_COLOR
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      controller
                                                          .lastScanDate.value,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: TEXT_COLOR),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: PADDING),
                                  child: OutLinedTextField(
                                    onChanged: (text) {
                                      controller.outstanding.value = text;
                                    },
                                    label: 'Total Outstanding',
                                    keyboardType: TextInputType.number,
                                    hasError:
                                        controller.accountNameError.value != '',
                                    errorLabel:
                                        controller.accountNameError.value,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: PADDING),
                                  child: RoundedRectangleButton(
                                    label: 'Add Account',
                                    onPressed: () {
                                      Get.toNamed(Routes.SCAN, arguments: {
                                        'prevRoute': Routes.ADDACCOUNT
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
