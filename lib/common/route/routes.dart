import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/view/root_tab.dart';
import 'package:custom_clothes/custom/view/select_fabric_screen.dart';
import 'package:custom_clothes/user/view/email_find_screen.dart';
import 'package:custom_clothes/user/view/email_login_screen.dart';
import 'package:custom_clothes/user/view/email_password_reset_screen.dart';
import 'package:custom_clothes/user/view/email_register_screen.dart';
import 'package:custom_clothes/user/view/login_screen.dart';
import 'package:custom_clothes/user/view/terms_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  // root tab
  static const String root = '/root';

  // custom
  static const String selectFabric = '/select/fabric';


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

  RouteNames.root: (_) => RootTab(),

  RouteNames.selectFabric: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String id = '';
    if (args.title == 'id') {
      id = args.message;
    } else {
      id = '0';
    }
    return SelectFabricScreen(id: id);
  }

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
