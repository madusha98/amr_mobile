import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoundedRectangleButton({Key key, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            backgroundColor: MaterialStateProperty.all<Color>(TEXT_COLOR),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(fontSize: 17)),
      ));
}
