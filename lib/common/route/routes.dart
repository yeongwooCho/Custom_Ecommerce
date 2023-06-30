import 'package:custom_clothes/common/view/completion_screen.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/view/root_tab.dart';
import 'package:custom_clothes/custom/view/custom_guide_screen.dart';
import 'package:custom_clothes/custom/view/printing_screen.dart';
import 'package:custom_clothes/custom/view/select_fabric_screen.dart';
import 'package:custom_clothes/purchase/view/purchase_screen.dart';
import 'package:custom_clothes/search/view/product_detail_screen.dart';
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

  // global
  static const String completion = '/completion';

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
  static const String printing = '/printing';
  static const String customGuide = '/custom/guide';

  // search
  static const String productDetail = '/product/detail';

  // purchase
  static const String purchase = '/purchase';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // global
  RouteNames.completion: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String title = '';
    if (args.title == 'title') {
      title = args.message;
    } else {
      title = '_';
    }
    return CompletionScreen(title: title);
  },

  // login, register, findID, passwordReset
  RouteNames.login: (_) => LoginScreen(),
  RouteNames.emailLogin: (_) => EmailLoginScreen(),
  RouteNames.emailRegister: (_) => EmailRegisterScreen(),
  RouteNames.emailFind: (_) => EmailFindScreen(),
  RouteNames.emailPasswordReset: (_) => EmailPasswordResetScreen(),
  RouteNames.terms: (_) => TermsScreen(),

  // root tab
  RouteNames.root: (_) => RootTab(),

  // custom
  RouteNames.customGuide: (_) => CustomGuideScreen(),
  RouteNames.selectFabric: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String id = '';
    if (args.title == 'id') {
      id = args.message;
    } else {
      id = '0';
    }
    return SelectFabricScreen(id: id);
  },
  RouteNames.printing: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String id = '';
    if (args.title == 'id') {
      id = args.message;
    } else {
      id = '0';
    }
    return PrintingScreen(id: id);
  },

  // search
  RouteNames.productDetail: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String id = '';
    if (args.title == 'id') {
      id = args.message;
    } else {
      id = '0';
    }
    return ProductDetailScreen(id: id);
  },

  // purchase
  RouteNames.purchase: (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    String id = '';
    if (args.title == 'id') {
      id = args.message;
    } else {
      id = '0';
    }
    return PurchaseScreen(id: id);
  },
};
