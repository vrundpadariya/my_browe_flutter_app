import 'dart:async';

import 'package:flutter/material.dart';

class Splash_screens extends StatefulWidget {
  const Splash_screens({super.key});

  @override
  State<Splash_screens> createState() => _Splash_screensState();
}

class _Splash_screensState extends State<Splash_screens> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "HomePage");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/asset/splash screen.gif"),
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
