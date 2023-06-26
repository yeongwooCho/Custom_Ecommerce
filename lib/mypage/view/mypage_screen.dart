import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text(
          'MypageScreen',
        ),
      ),
    );
  }
}
