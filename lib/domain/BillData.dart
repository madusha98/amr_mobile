import 'dart:ui';

class BillData {
  /// Holds the datapoint values like x, y, etc.,
  BillData({this.month, this.billValue, this.units, this.pointColor});

  /// Holds x value of the datapoint
  final dynamic month;

  /// Holds y value of the datapoint
  final num billValue;

  /// Holds y value of the datapoint
  final num units;

  /// Holds point color of the datapoint
  final Color pointColor;
}
