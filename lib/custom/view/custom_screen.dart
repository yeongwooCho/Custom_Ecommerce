import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text(
          'CustomScreen',
        ),
      ),
    );
  }
}
