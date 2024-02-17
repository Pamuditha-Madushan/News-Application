// ignore_for_file: library_private_types_in_public_api, file_names, must_call_super

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/screens/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 67, 134),
      body: Container(
        color: const Color(0x001a2238),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ZEE-NEWS',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SpinKitThreeBounce(
                color: Color.fromRGBO(51, 196, 176, 1),
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
