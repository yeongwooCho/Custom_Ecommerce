import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomRatioSlider extends StatelessWidget {
  final String title;
  final double ratioValue;
  final ValueChanged<double>? onRatioValueChange;
  final double thumbSize;

  const CustomRatioSlider({
    Key? key,
    required this.title,
    required this.ratioValue,
    required this.onRatioValueChange,
    this.thumbSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: bodyBoldTextStyle,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: WHITE_TEXT_COLOR,
                  activeTrackColor: PRIMARY_COLOR,
                  inactiveTrackColor: MIDDLE_GREY_COLOR,
                  disabledThumbColor: ERROR_COLOR,
                  disabledActiveTrackColor: ERROR_COLOR,
                  disabledInactiveTrackColor: MIDDLE_GREY_COLOR,
                  trackHeight: 6.0,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: thumbSize,
                    elevation: 5.0,
                  ),
                ),
                child: Slider(
                  min: 1.0,
                  max: 100.0,
                  divisions: 99,
                  value: ratioValue,
                  onChanged: onRatioValueChange,
                  label: '${ratioValue.toStringAsFixed(0)} %',
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              decoration: BoxDecoration(
                color: title != '배합률 합계' ? PRIMARY_COLOR : ERROR_COLOR,
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${ratioValue.toStringAsFixed(0)} %',
                    style: bodyBoldWhiteTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
