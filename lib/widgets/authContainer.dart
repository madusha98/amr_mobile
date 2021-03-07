import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AuthContainer extends StatelessWidget {
  final Widget child;
  final AppBar appBar;

  Future<bool> showAlert(context) async {
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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            SystemNavigator.pop();
            Future.delayed(Duration(milliseconds: 500))
                .then((value) => exit(0));
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 20),
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

  const AuthContainer({Key key, this.child, this.appBar}) : super(key: key);
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => showAlert(context),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: appBar ??
                AppBar(
                  actions: [
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/logodarkbg.png'),
                      ),
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
            body: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, 0.0),
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(child: child),
                ),
              ],
            ),
          ),
        ),
      );
}
