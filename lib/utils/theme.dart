import 'package:flutter/material.dart';

var theme = ThemeData(
    // Colors
    primaryColor: Color.fromRGBO(21, 75, 189, 1),
    accentColor: Color.fromRGBO(180, 71, 233, 1),

    // Text
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 36),
      headline6: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontSize: 12),
    ));
