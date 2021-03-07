import 'package:amr_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final Widget child;
  final AppBar appBar;

  const AuthContainer({Key key, this.child, this.appBar}) : super(key: key);
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => backHandler(context),
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
                      //color: Theme.of(context).primaryColor.withOpacity(0.4),
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
                      fit: BoxFit.fill,
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
