import 'package:flutter/material.dart';
import 'package:islami_app_task1/providers/most_recent_provider.dart';
import 'package:islami_app_task1/ui/home/home_screen.dart';
import 'package:islami_app_task1/ui/home/tabs/hadith/hadith_details_screen.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app_task1/utils/app_routes.dart';
import 'package:islami_app_task1/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isFirstTime = prefs.getBool('firstTime') ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(isFirstTime: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime
          ? AppRoutes.onBoardingRouteName
          : AppRoutes.homeRouteName,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.hadithDetailsRouteName: (context) => HadithDetailsScreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetailsScreen1(),
        AppRoutes.onBoardingRouteName: (context) => OnboardingScreen(),
      },
    );
  }
}
