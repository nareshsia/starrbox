import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:starrbox/routes/app_router.dart';
import 'package:starrbox/routes/route_names.dart';

import '../../core/local/shared_pref.dart';
import '../../core/local/shared_prefs_keys.dart';

class SplashController extends ChangeNotifier {
  checkSessionAndNavigate({required BuildContext context}) {
    final token = SharedPrefs.getString(SharedPrefKeys.authToken);

    Timer(Duration(seconds: 3), () {
      if (token.isNotEmpty) {
        Navigator.pushReplacementNamed(
            context, RouteNames.phoneAuth); // nav to logIn after 3 seconds
        return;
      }
      Navigator.pushReplacementNamed(
          context, RouteNames.phoneAuth); // nav to logIn after 3 seconds
    });
  }
}
