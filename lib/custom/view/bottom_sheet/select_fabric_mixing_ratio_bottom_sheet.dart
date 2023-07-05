import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/model/enum/fabric_label.dart';
import 'package:custom_clothes/custom/component/custom_ratio_slider.dart';
import 'package:flutter/material.dart';

class SelectFabricMixingRatioBottomSheet extends StatefulWidget {
  final List<FabricLabel> selectedItems;
  final List<double> selectedMixingRatioValues;
  final void Function()? popBottomSheet;

  const SelectFabricMixingRatioBottomSheet({
    Key? key,
    required this.selectedItems,
    required this.selectedMixingRatioValues,
    required this.popBottomSheet,
  }) : super(key: key);

  @override
  State<SelectFabricMixingRatioBottomSheet> createState() =>
      _SelectFabricMixingRatioBottomSheetState();
}

class _SelectFabricMixingRatioBottomSheetState
    extends State<SelectFabricMixingRatioBottomSheet> {
  double ratioValue = 25.0;
  List<double> selectedMixingRatioItemsValues = [];
  List<ValueChanged<double>> valueChanges = [];
  double totalRatio = 100.0;

  @override
  void initState() {
    super.initState();

    int selectedItemsCount = widget.selectedItems.length;
    selectedMixingRatioItemsValues = initMixingRatioItemsValues(
      itemCount: selectedItemsCount,
    );
    totalRatio = selectedMixingRatioItemsValues.reduce(
      (value, element) => value + element,
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedItemsCount = widget.selectedItems.length;
    valueChanges = getValueChanges(itemCount: selectedItemsCount);

    return selectedItemsCount < 8 ? renderLittleFabric() : renderManyFabric();
  }

  Widget renderLittleFabric() {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: EMPTY_COLOR,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: BACKGROUND_COLOR,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
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
                  children: widget.selectedItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    String title = entry.value.label;

                    return CustomRatioSlider(
                      title: title,
                      ratioValue:
                          selectedMixingRatioItemsValues[index].toDouble(),
                      onRatioValueChange: valueChanges[index],
                    );
                  }).toList(),
                ),
                CustomRatioSlider(
                  title: '배합률 합계',
                  ratioValue: totalRatio,
                  onRatioValueChange: null,
                  thumbSize: 0.0,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: totalRatio == 100.0
                        ? () {
                            for (double element
                                in selectedMixingRatioItemsValues) {
                              widget.selectedMixingRatioValues.add(element);
                            }
                            widget.popBottomSheet!();
                          }
                        : null,
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

  Widget renderManyFabric() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 200.0,
              color: EMPTY_COLOR,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: BACKGROUND_COLOR,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
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
                    children: widget.selectedItems.asMap().entries.map((entry) {
                      int index = entry.key;
                      String title = entry.value.label;

                      return CustomRatioSlider(
                        title: title,
                        ratioValue:
                            selectedMixingRatioItemsValues[index].toDouble(),
                        onRatioValueChange: valueChanges[index],
                      );
                    }).toList(),
                  ),
                  CustomRatioSlider(
                    title: '배합률 합계',
                    ratioValue: totalRatio,
                    onRatioValueChange: null,
                    thumbSize: 0.0,
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: totalRatio == 100.0
                          ? () {
                              for (double element
                                  in selectedMixingRatioItemsValues) {
                                widget.selectedMixingRatioValues.add(element);
                              }
                              widget.popBottomSheet!();
                            }
                          : null,
                      child: const Text('원단 배합률 지정'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ValueChanged<double>> getValueChanges({
    required int itemCount,
  }) {
    List<ValueChanged<double>> valueChanges = [];

    for (int i = 0; i < itemCount; i++) {
      valueChanges.add((double value) {
        setState(() {
          double totalWithCurrentValue = selectedMixingRatioItemsValues
              .asMap()
              .entries
              .fold(0.0, (previousValue, element) {
            if (element.key == i) {
              return previousValue;
            }
            return previousValue + element.value;
          });

          if (totalWithCurrentValue + value < 100) {
            selectedMixingRatioItemsValues[i] = value;
          } else {
            selectedMixingRatioItemsValues[i] = 100.0 - totalWithCurrentValue;
          }

          totalRatio = selectedMixingRatioItemsValues
              .reduce((value, element) => value + element);
        });
      });
    }

    return valueChanges;
  }

  List<double> initMixingRatioItemsValues({
    required int itemCount,
  }) {
    if (itemCount == 0) {
      return [];
    }

    int quotient = 100 ~/ itemCount;
    int division = 100 % itemCount;
    List<double> mixingRatioItemsValue = [];

    for (int i = 0; i < itemCount; i++) {
      if (i == 0) {
        mixingRatioItemsValue.add((quotient + division).toDouble());
      } else {
        mixingRatioItemsValue.add(quotient.toDouble());
      }
    }

    return mixingRatioItemsValue;
  }
}
