import 'package:custom_clothes/common/component/custom_text_form_field.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/custom/component/color_container.dart';
import 'package:flutter/material.dart';

class PrintingAddTextBottomSheet extends StatefulWidget {
  final void Function()? popBottomSheet;
  final void Function({
    required String title,
    required TextStyle textStyle,
  })? addText;

  const PrintingAddTextBottomSheet({
    Key? key,
    required this.popBottomSheet,
    required this.addText,
  }) : super(key: key);

  @override
  State<PrintingAddTextBottomSheet> createState() =>
      _PrintingAddTextBottomSheetState();
}

class _PrintingAddTextBottomSheetState
    extends State<PrintingAddTextBottomSheet> {
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

  String inputText = '';
  String inputTextSize = '';

  void onChangedText(String val) {
    print(val);
    inputText = val;
  }

  void onChangedTextSize(String val) {
    print(val);
    inputTextSize = val;
  }

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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        '텍스트 입력',
                        style: bodyBoldTextStyle,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextFormField(
                        onChanged: onChangedText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        '텍스트 크기',
                        style: bodyBoldTextStyle,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextFormField(
                        keyboardType: KeyboardType.number,
                        onChanged: onChangedTextSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '텍스트 색상',
                    style: bodyBoldTextStyle,
                  ),
                ),
                const SizedBox(height: 8.0),
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
                    // widget.selectColor!(color: selectedColor);
                    int inputTextSizeToInt =
                        int.parse(inputTextSize.trim()) ?? 0;
                    widget.addText!(
                        title: inputText,
                        textStyle: TextStyle(
                          color: selectedColor,
                          fontSize: inputTextSizeToInt <= 200
                              ? inputTextSizeToInt.toDouble()
                              : 200.0,
                        ));
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
