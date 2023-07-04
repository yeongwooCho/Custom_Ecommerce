import 'dart:developer';

import 'package:custom_clothes/common/const/custom_button_style.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/view/root_tab.dart';
import 'package:custom_clothes/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/const/colors.dart';
import 'common/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: defaultButtonStyle,
        ),
      ),
      home: const SplashScreen(),
      // home: const LoginScreen()
    );
  }
}
