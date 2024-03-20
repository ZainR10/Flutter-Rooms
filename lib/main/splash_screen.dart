import 'dart:async'; // Added import for Timer

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rooms/utils/routes_name.dart';
// import 'info.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'login.dart';

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
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, RoutesName.Info);
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, RoutesName.Login);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Animate(
        effects: const [
          FadeEffect(duration: Durations.long3),
          ThenEffect(),
          SlideEffect(begin: Offset(0, -1)),
          ThenEffect(),
          MoveEffect(begin: Offset(0, 50)),
        ],
        child: const Text('Welcome',
            style: TextStyle(
                fontSize: 50,
                color: Colors.indigo,
                fontWeight: FontWeight.bold)),
      )),
    );
  }
}
