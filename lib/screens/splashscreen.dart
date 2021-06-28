import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.yellowAccent,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/kobra.png',
            alignment: Alignment.center,
            width: getPercentage(context, 55.33),
            fit: BoxFit.fitWidth,
          ),
          Padding(padding: EdgeInsets.only(top: 30.0)),
          CupertinoActivityIndicator(
            animating: true,
            radius: 12.0,
          ),
        ],
      ),
    );
  }
  Future<void> navigateToScreen() {
    Timer(Duration(seconds: 2), () async {
      await Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => MainScreen()));
    });
  }
}