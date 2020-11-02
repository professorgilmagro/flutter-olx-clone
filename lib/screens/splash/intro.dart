import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:xlo_mobx/screens/base/base.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        loadingText: Text(
          'From codespace.com',
          style: TextStyle(color: Colors.white),
        ),
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [HexColor("#000000"), Colors.black87],
        ),
        navigateAfterSeconds: BaseScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.stream,
                color: Colors.green,
                size: 120,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(width: 20.0, height: 50.0),
                Text(
                  "OLX Clone ",
                  style: GoogleFonts.acme(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
