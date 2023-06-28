import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/custom/component/custom_ratio_slider.dart';
import 'package:flutter/material.dart';

class SelectFabricMixingRatioBottomSheet extends StatefulWidget {
  final List<String> selectedItems;
  final void Function()? popBottomSheet;

  const SelectFabricMixingRatioBottomSheet({
    Key? key,
    required this.selectedItems,
    required this.popBottomSheet,
  }) : super(key: key);

  @override
  State<SelectFabricMixingRatioBottomSheet> createState() =>
      _SelectFabricMixingRatioBottomSheetState();
}

class _SelectFabricMixingRatioBottomSheetState
    extends State<SelectFabricMixingRatioBottomSheet> {
  double ratioValue = 25.0;

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
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: widget.selectedItems
                      .map(
                        (e) => CustomRatioSlider(
                          title: e,
                          ratioValue: ratioValue,
                          onRatioValueChange: onRatioValueChange,
                        ),
                      )
                      .toList(),
                ),
                CustomRatioSlider(
                  title: '배합률 합계',
                  ratioValue: ratioValue,
                  onRatioValueChange: null,
                  thumbSize: 0.0,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: widget.popBottomSheet,
                    child: const Text('원단 배합률 지정'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onRatioValueChange(double value) {
    setState(() {
      ratioValue = value;
    });
  }
}
