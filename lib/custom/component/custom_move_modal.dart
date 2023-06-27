import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_button_style.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomMoveModal extends StatelessWidget {
  final String id;
  final String topButtonTitle;
  final String bottomButtonTitle;

  const CustomMoveModal({
    Key? key,
    required this.id,
    required this.topButtonTitle,
    required this.bottomButtonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(id),
            ),
            ElevatedButton(
              onPressed: () {

              },
              child: Text(topButtonTitle),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {},
              style: secondButtonStyle,
              child: Text(bottomButtonTitle, style: bodyMediumTextStyle,),
            ),
          ],
        ),
      ),
    );
  }
}
