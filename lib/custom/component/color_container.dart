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
            width: isSelected ? 8.0 : 1.0,
            color: Colors.black,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 50.0,
        width: 50.0,
        child: isSelected
            ? color == Colors.black
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : const Icon(Icons.check)
            : null,
      ),
    );
  }
}
