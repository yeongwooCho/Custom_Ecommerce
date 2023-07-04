import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final void Function()? onTap;

  const SelectableItem({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Chip(
            side: BorderSide(
              color: isSelected ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
            ),
            backgroundColor: isSelected ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
            elevation: 0.0,
            labelPadding: const EdgeInsets.only(left: 8.0),
            avatar: CircleAvatar(
              backgroundColor: isSelected ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
              child: Icon(
                Icons.check_circle,
                color: isSelected ? WHITE_TEXT_COLOR : DARK_GREY_COLOR,
              ),
            ),
            label: Text(
              title,
              style: isSelected
                  ? bodyBoldWhiteTextStyle
                  : bodyBoldTextStyle.copyWith(
                      color: DARK_GREY_COLOR,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
