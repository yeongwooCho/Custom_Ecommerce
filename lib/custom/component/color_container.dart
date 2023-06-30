import 'package:custom_clothes/common/const/colors.dart';
import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorContainer({
    Key? key,
    required this.color,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
              width: isSelected ? 5.0 : 1.0, color: DEFAULT_TEXT_COLOR),
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 50.0,
        width: 50.0,
        child: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
