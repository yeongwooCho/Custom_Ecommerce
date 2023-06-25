import 'package:custom_clothes/home/view/home_screen.dart';
import 'package:custom_clothes/user/view/email_find_screen.dart';
import 'package:custom_clothes/user/view/email_login_screen.dart';
import 'package:custom_clothes/user/view/email_password_reset_screen.dart';
import 'package:custom_clothes/user/view/email_register_screen.dart';
import 'package:custom_clothes/user/view/login_screen.dart';
import 'package:custom_clothes/user/view/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// TODO: arguments에 대한 정의 필요
class RouteNames {
  // initial
  static const String splash = '/';

  // login, register, findID, passwordReset
  static const String login = '/login';
  static const String emailLogin = '/email/login';
  static const String emailRegister = '/email/register';
  static const String emailFind = '/email/find/';
  static const String emailPasswordReset = '/email/password/reset';
  static const String terms = '/terms';

  // home
  static const String home = '/home';

  // // user
  // static const String onBoarding = '/on_boarding';
  // static const String register = '/register';
  // static const String registerCompletion = '/register/completion';
  // static const String login = '/login';
  //
  // // group
  // static const String groupList = '/group/list';
  // static const String groupRegister = '/group/register';
  // static const String groupParticipate = '/group/participate';
  // static const String groupStatus = '/group/status';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteNames.login: (_) => LoginScreen(),
  RouteNames.emailLogin: (_) => EmailLoginScreen(),
  RouteNames.emailRegister: (_) => EmailRegisterScreen(),
  RouteNames.emailFind: (_) => EmailFindScreen(),
  RouteNames.emailPasswordReset: (_) => EmailPasswordResetScreen(),
  RouteNames.terms: (_) => TermsScreen(),

  RouteNames.home: (_) => HomeScreen(),

  // // user
  // RouteNames.onBoarding: (_) => OnBoardingScreen(),
  // RouteNames.register: (_) => RegisterScreen(),
  // RouteNames.registerCompletion: (_) => RegisterCompletionScreen(),
  // RouteNames.login: (_) => LoginScreen(),
  //
  // // group
  // RouteNames.groupList: (_) => GroupListScreen(),
  // RouteNames.groupRegister: (_) => GroupRegisterScreen(),
  // RouteNames.groupParticipate: (_) => GroupParticipateScreen(),
  // RouteNames.groupStatus: (_) => GroupStatusScreen(),
};
