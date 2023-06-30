import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  final String id;

  const PurchaseScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '주문서 작성',
      ),
      child: Center(
        child: Text('asfd'),
      ),
    );
  }
}
