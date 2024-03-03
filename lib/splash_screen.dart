import 'dart:async'; // Added import for Timer

import 'package:flutter/material.dart';
import 'info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Fixed constructor syntax

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) {
      Timer(const Duration(seconds: 6), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Info()));
      });
    } else {
      Timer(const Duration(seconds: 6), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text('Welcome',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
    );
  }
}
