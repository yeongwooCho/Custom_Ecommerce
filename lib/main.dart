import 'dart:developer';

import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/user/view/login_screen.dart';
import 'package:flutter/material.dart';

import 'common/const/colors.dart';
import 'common/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        log('current settings: $settings');
        return MaterialPageRoute(
          builder: routes[settings.name!]!,
          settings: settings,
        );
      },
      theme: ThemeData(
        backgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: WHITE_TEXT_COLOR,
            backgroundColor: PRIMARY_COLOR,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size(100, 57),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      // home: const SplashScreen(),
      home: const LoginScreen()
    );
  }
}
