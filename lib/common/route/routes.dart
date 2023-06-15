import 'package:custom_clothes/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// TODO: arguments에 대한 정의 필요
class RouteNames {
  // initial
  static const String splash = '/';

  // // user
  // static const String onBoarding = '/on_boarding';
  // static const String register = '/register';
  // static const String registerCompletion = '/register/completion';
  static const String login = '/login';
  //
  // // group
  // static const String groupList = '/group/list';
  // static const String groupRegister = '/group/register';
  // static const String groupParticipate = '/group/participate';
  // static const String groupStatus = '/group/status';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // // user
  // RouteNames.onBoarding: (_) => OnBoardingScreen(),
  // RouteNames.register: (_) => RegisterScreen(),
  // RouteNames.registerCompletion: (_) => RegisterCompletionScreen(),
  RouteNames.login: (_) => LoginScreen(),
  //
  // // group
  // RouteNames.groupList: (_) => GroupListScreen(),
  // RouteNames.groupRegister: (_) => GroupRegisterScreen(),
  // RouteNames.groupParticipate: (_) => GroupParticipateScreen(),
  // RouteNames.groupStatus: (_) => GroupStatusScreen(),
};
