import 'dart:io';

import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
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

Widget errorDialog(message) => AlertDialog(
      title: Text('Error'),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Close'))
      ],
    );

Widget twoButtonDialog(title, message, button1Label, button1Action,
        button2Label, button2Action) =>
    AlertDialog(
      title: Text(title),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: button1Action,
          child: Text(button1Label),
        ),
        TextButton(
          onPressed: button2Action,
          child: Text(button2Label),
        )
      ],
    );

Future<Position> getPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  var stopwatch = Stopwatch()..start();
  var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      // timeLimit: Duration(seconds: 30),
      forceAndroidLocationManager: false);
  print('getCurrentPosition() executed in ${stopwatch.elapsed}');
  stopwatch.stop();
  return position;
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
