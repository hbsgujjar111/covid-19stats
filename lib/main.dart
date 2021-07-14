import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'bottomnavigation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: BottomNav(),
      title: Text(
        'Welcome to\nCovid-19 Statistics App',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffEDEDED),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/logo.png'),
      backgroundColor: Color(0xff171717),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 150.0,
      loaderColor: Color(0xffDA0037),
    );
  }
}
