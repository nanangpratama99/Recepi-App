import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recepi_app_2/constant.dart';

import 'home_screen.dart';
import 'intro_screen.dart/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // timer
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const IntroScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/splash.jpg',
                fit: BoxFit.cover,
                height: size.height,
                width: size.width,
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height / 8),
                child: Column(
                  children: const [
                    Text(
                      "Cookieng Experience",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      "Like A Chef",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Let's make a delicious dish with\nthe best recipe for the family"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
