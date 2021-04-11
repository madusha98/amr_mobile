import 'package:amr_mobile/controller/auth/addAccountController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:amr_mobile/widgets/roundedRectangleButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
                                RoundedRectangleButton(
                                  label: 'Add',
                                  onPressed: () {
                                    controller.addAccount();
                                    // Get.offNamed(Routes.HOME);
                                  },
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
