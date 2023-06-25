import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EmailFindScreen extends StatelessWidget {
  const EmailFindScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '아이디 찾기',
      ),
      child: Text('asdf'),
    );
  }
}
