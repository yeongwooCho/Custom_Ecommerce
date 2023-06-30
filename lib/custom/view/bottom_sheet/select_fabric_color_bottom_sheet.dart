import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/custom/component/color_container.dart';
import 'package:flutter/material.dart';

class SelectFabricColorBottomSheet extends StatefulWidget {
  final void Function({required Color color})? selectColor;
  final void Function()? popBottomSheet;

  const SelectFabricColorBottomSheet({
    Key? key,
    required this.selectColor,
    required this.popBottomSheet,
  }) : super(key: key);

  @override
  State<SelectFabricColorBottomSheet> createState() =>
      _SelectFabricColorBottomSheetState();
}

class _SelectFabricColorBottomSheetState
    extends State<SelectFabricColorBottomSheet> {
  List<Color> basicColors = [
    Color(0xFFFFFFFF),
    Color(0xFF888888),
    Color(0xFF000000),
    Color(0xFFFF0000),
    Color(0xFFFF8C00),
    Color(0xFFF2A3FF),
    Color(0xFFA3FFBC),
    Color(0xFFFFFF00),
    Color(0xFF008000),
    Color(0xFF0000FF),
    Color(0xFF4B0082),
    Color(0xFF800080),
    Color(0xFF007880),
    Color(0xFFB66505),
  ];
  Color selectedColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
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
                Wrap(
                  children: basicColors
                      .map((e) => GestureDetector(
                            onTap: () {
                              selectedColor = e;
                              setState(() {});
                            },
                            child: ColorContainer(
                              color: e,
                              isSelected: e == selectedColor,
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    widget.selectColor!(color: selectedColor);
                    widget.popBottomSheet!();
                  },
                  child: const Text('원단 색상 지정'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
