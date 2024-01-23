import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:been_love_app/ui/pages/home_screen_page.dart';
import 'package:been_love_app/widget/gradient_text.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(
            text: "WPA",
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.white,
            ]),
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
            size: 70,
          ),
          SizedBox(
            width: 10,
          ),
          GradientText(
            text: "KKK",
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.green,
            ]),
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
      nextScreen: MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.pink,
      // pageTransitionType: PageTransitionType.scale,
    ));
  }
}
