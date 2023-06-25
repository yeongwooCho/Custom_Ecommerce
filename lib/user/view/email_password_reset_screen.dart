import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EmailPasswordResetScreen extends StatelessWidget {
  const EmailPasswordResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '비밀번호 초기화',
      ),
      child: Text('asdf'),
    );
  }
}
