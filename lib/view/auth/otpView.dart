import 'package:amr_mobile/controller/auth/otpController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/widgets/authContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Otp extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) => AuthContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0.0, top: 100.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: PADDING, right: PADDING),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter verification code',
                            style: Get.textTheme.headline6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: PADDING),
                            child: Text(
                              'We sent you a verification code via SMS.',
                              style: TextStyle(
                                fontSize: 15,
                                color: TEXT_COLOR.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, right: 20.0, bottom: 20.0),
                            child: Container(
                              transform:
                                  Matrix4.translationValues(-8.0, 0.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  inputDecorationTheme: InputDecorationTheme(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: TEXT_COLOR,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: TEXT_COLOR,
                                      ),
                                    ),
                                  ),
                                ),
                                child: OTPTextField(
                                  length: 6,
                                  width: MediaQuery.of(context).size.width,
                                  fieldWidth: 40,
                                  style: TextStyle(
                                      fontSize: 24, color: TEXT_COLOR),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.underline,
                                  onCompleted: controller.confirmOtp,
                                  onChanged: (text) =>
                                      controller.otp.value = text,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Didn\'t receive it?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                  child: TouchableOpacity(
                    onTap: () {
                      //
                    },
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
