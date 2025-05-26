import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/home/home_view.dart';

class SplashScreen extends StatefulWidget {
  final int seconds;
  const SplashScreen({Key? key, this.seconds = 3}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/SRocksMusicLogo.png', 
              width: 150,
              height: 150,
            ),
          ),
          Text(
            "S-Rocks-Music",
            style: GoogleFonts.syne(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold, 
            ),
          ),
        ],
      ),
    );
  }
}
