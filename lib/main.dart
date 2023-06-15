import 'dart:developer';

import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
