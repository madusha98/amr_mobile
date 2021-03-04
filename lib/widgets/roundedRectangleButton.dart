import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRectangleButton extends StatelessWidget {
  final String label;
  final String onPressed;

  const RoundedRectangleButton({Key key, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 13,
      width: double.infinity,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () {},
        color: Colors.white,
        textColor: Color.fromRGBO(21, 75, 189, 1),
        child: Text(label, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
