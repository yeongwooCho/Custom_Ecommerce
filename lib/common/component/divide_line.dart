import 'package:custom_clothes/common/const/colors.dart';
import 'package:flutter/material.dart';

class DivideLine extends StatelessWidget {
  const DivideLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: double.infinity,
      color: LIGHT_GREY_COLOR,
    );
  }
}
