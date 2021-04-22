import 'package:flutter/material.dart';

// const baseUrl =
//     'https://v36cu19x54.execute-api.ap-southeast-1.amazonaws.com/production/';
// const baseUrl =
//     'https://voy7gyvr16.execute-api.ap-southeast-1.amazonaws.com/dev/';
const baseUrl =
    'https://47824ogip6.execute-api.ap-southeast-1.amazonaws.com/qa/';
// const baseUrl = 'http://192.168.43.204:3000/dev/';

const PADDING = 15.0;

class StorageKeys {
  static final String TOKEN = 'token';
  static final String IS_FIRST_TIME = 'isFirstTime';
  static final String PUSH_TOKEN = 'pushToken';
  static final String ACCOUNT_ADDED = 'accountAdded';
  static final String ACCOUNT_ID = 'accountID';
}

const MONTH_NAMES = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

// Colors
const PRIMARY_COLOR = Color.fromRGBO(21, 75, 189, 1);
const ACCENNT_COLOR = Color.fromRGBO(180, 71, 233, 1);
const ERROR_COLOR = Color.fromRGBO(163, 0, 0, 1);
const TEXT_COLOR = Colors.white;
const BACKGROUND_COLOR = Color.fromRGBO(249, 251, 255, 1);
