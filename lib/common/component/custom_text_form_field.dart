import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? buttonText;
  final GestureTapCallback? onPressed;

  const CustomTextFormField({
    Key? key,
    this.title,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              title!,
              style: bodyMediumTextStyle,
            ),
          ),
        const SizedBox(height: 4.0),
        if (buttonText != null)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText!),
              ),
            ],
          ),
        if (buttonText == null)
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
      ],
    );
  }
}
