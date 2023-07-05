import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool? isSelected;

  const CustomContainerButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: onTap != null ? BACKGROUND_COLOR : LIGHT_GREY_COLOR,
          border: Border.all(
            color: onTap != null ? DEFAULT_TEXT_COLOR : LIGHT_GREY_COLOR,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 24.0,
                height: 24.0,
              ),
              Text(
                title,
                style: onTap != null
                    ? bodyBoldTextStyle
                    : bodyMediumTextStyle.copyWith(color: DARK_GREY_COLOR),
              ),
              const SizedBox(width: 12.0),
              if (onTap != null && isSelected != null)
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: isSelected! ? PRIMARY_COLOR : DARK_GREY_COLOR,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
