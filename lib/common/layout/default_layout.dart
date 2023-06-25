import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final Widget child;

  const DefaultLayout({
    required this.child,
    this.appbar,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: backgroundColor ?? Colors.white, // 기본배경이 완전 흰색은 아니다.
      body: child,
    );
  }
}
