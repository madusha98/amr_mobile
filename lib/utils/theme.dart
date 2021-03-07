import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

var theme = ThemeData(
    // Colors
    primaryColor: PRIMARY_COLOR,
    accentColor: ACCENNT_COLOR,
    errorColor: ERROR_COLOR,

    // Text
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 36),
      headline6: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontSize: 12),
    ));
