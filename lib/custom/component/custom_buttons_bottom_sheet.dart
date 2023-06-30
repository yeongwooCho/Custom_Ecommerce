import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_button_style.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonsBottomSheet extends StatelessWidget {
  final String id;
  final String topButtonTitle;
  final String bottomButtonTitle;
  final Function()? onPressedTopButton;
  final Function()? onPressedBottomButton;

  const CustomButtonsBottomSheet({
    Key? key,
    required this.id,
    required this.topButtonTitle,
    required this.bottomButtonTitle,
    required this.onPressedTopButton,
    required this.onPressedBottomButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: EMPTY_COLOR,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              ElevatedButton(
                onPressed: () {
                    if (onPressedTopButton != null) {
                      onPressedTopButton!();
                    }
                  },
                  child: Text(topButtonTitle),
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                    if (onPressedBottomButton != null) {
                      onPressedBottomButton!();
                    }
                  },
                  style: secondButtonStyle,
                  child: Text(
                    bottomButtonTitle,
                    style: bodyMediumTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
