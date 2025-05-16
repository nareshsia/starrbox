import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starrbox/core/constants/assets.dart';
import 'package:starrbox/features/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) {
        Provider.of<SplashController>(context, listen: false)
            .checkSessionAndNavigate(context: context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(AppAssets.splash),
      ),
    );
  }
}
