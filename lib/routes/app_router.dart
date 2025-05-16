import 'package:flutter/material.dart';
import 'package:starrbox/features/auth/phone_auth_screen.dart';
import 'package:starrbox/features/splash/splash_screen.dart';
import 'package:starrbox/routes/route_names.dart';

class AppRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

        case RouteNames.phoneAuth:
        return MaterialPageRoute(
          builder: (context) => PhoneAuthScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
