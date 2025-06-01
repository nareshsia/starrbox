import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/core/theme/app_theme.dart';
import 'package:starrbox/features/splash/splash_controller.dart';
import 'package:starrbox/features/subscription/subscription_controller.dart';
import 'package:starrbox/features/survey/survey_controller.dart';
import 'package:starrbox/routes/app_router.dart';
import 'package:starrbox/routes/route_names.dart';

import 'core/local/shared_pref.dart';
import 'core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Initialize core services
  await SharedPrefs.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  /// Run App with Providers
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(
        create: (context) => SplashController(),
      ),
      ChangeNotifierProvider(
        create: (context) => SurveyController(),
      ),
      ChangeNotifierProvider(
        create: (context) => SubscriptionController(),
      ),


    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /// ✅ This context is now BELOW MultiProvider and safe
    final themeProvider = Provider.of<ThemeProvider>(context);
    print("themeMode:${themeProvider.themeMode}");

    // Check effective brightness
    final Brightness systemBrightness =
        MediaQuery.of(context).platformBrightness;

    final isDark = themeProvider.themeMode == ThemeMode.dark ||
        (themeProvider.themeMode == ThemeMode.system &&
            systemBrightness == Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      // systemNavigationBarColor: isDark ? const Color(0xFF1C1C1E) : Colors.white,
    ));

    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: RouteNames.splash,
          onGenerateRoute: AppRouter.generatedRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
