import 'dart:io';

import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

bool verifyEmail(String text) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(text);

bool verifyNic(String text) =>
    RegExp(r'^([0-9]{9}[x|X|v|V]|[0-9]{12})$').hasMatch(text);

bool verifyMobile(String text) =>
    RegExp(r'^(?:7|0|(?:\+94))[0-9]{9,10}$').hasMatch(text);

Future<bool> backHandler(context) async {
  if (Navigator.of(context).canPop()) {
    return Future.value(true);
  }
  var res = await Alert(
    context: context,
    type: AlertType.warning,
    title: '',
    desc: 'Are you sure you want to exit?',
    buttons: [
      DialogButton(
        child: Text(
          'OK',
          style: TextStyle(color: TEXT_COLOR, fontSize: 20),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          SystemNavigator.pop();
          Future.delayed(Duration(milliseconds: 500)).then((value) => exit(0));
        },
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          'Cancel',
          style: TextStyle(color: TEXT_COLOR, fontSize: 20),
        ),
        onPressed: () => Navigator.of(context).pop(),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();
  return res;
}
