import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'Next Screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          nextScreen: NextScreen(),
          duration: 3000,
          curve: Curves.decelerate,
          splash: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              textColor: Colors.lightBlueAccent,
            ),
          ),
          animationDuration: Duration(seconds: 2),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
        )
    );
  }
}
