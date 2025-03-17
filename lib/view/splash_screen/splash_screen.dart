import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("taste",style: TextStyle(fontSize: 60,
        color: ColorConstants.darkblue,
        fontWeight: FontWeight.bold),),
      ),
    );
  }
} 