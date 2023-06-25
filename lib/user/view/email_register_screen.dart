import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EmailRegisterScreen extends StatelessWidget {
  const EmailRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '회원가입',
      ),
      child: Text('asdf'),
    );
  }
}
