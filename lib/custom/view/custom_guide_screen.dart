import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class CustomGuideScreen extends StatelessWidget {
  const CustomGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text('CustomGuideScreen'),
      ),
    );
  }
}
