import 'package:flutter/material.dart';
import 'package:flutter_rooms/main/info.dart';
import 'package:flutter_rooms/main/login.dart';
import 'package:flutter_rooms/main/splash_screen.dart';
import 'package:flutter_rooms/utils/routes_name.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.SplashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesName.Login:
        return MaterialPageRoute(builder: (context) => const Login());

      case RoutesName.Info:
        return MaterialPageRoute(builder: (context) => const Info());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('no route')),
          );
        });
    }
  }
}
