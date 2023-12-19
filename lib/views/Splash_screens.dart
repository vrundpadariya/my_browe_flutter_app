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
      Navigator.pushNamed(context, "intro");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/asset/Logo-4-[remix].gif"),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
