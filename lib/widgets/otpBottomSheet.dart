import 'package:flutter/material.dart';

class OtpBottomSheet extends StatelessWidget {
  final ValueSetter<String> onChangedText;
  final VoidCallback confirmOtp;
  final VoidCallback resendOtp;

  const OtpBottomSheet(
      {Key key, this.onChangedText, this.confirmOtp, this.resendOtp})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: onChangedText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Otp',
                ),
                autofocus: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Resend OTP'),
                    onPressed: resendOtp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Confirm OTP'),
                    onPressed: confirmOtp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
