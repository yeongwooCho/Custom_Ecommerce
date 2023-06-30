import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class CustomGuideScreen extends StatelessWidget {
  const CustomGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '커스텀 사용 설명서',
        leading: const Text(''),
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close_rounded,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 36.0),
            Image.asset(
              'asset/image/custom_guide/custom_guide.png',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
