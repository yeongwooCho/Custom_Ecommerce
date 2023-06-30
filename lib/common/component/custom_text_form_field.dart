import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum KeyboardType {
  number,
  everything,
}

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final KeyboardType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    this.title,
    this.buttonText,
    this.onPressed,
    this.keyboardType = KeyboardType.everything,
    this.onChanged,
    this.obscureText = false,
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
                child: _TextField(
                  keyboardType: keyboardType,
                  obscureText: obscureText,
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
          _TextField(
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  final bool obscureText;
  final KeyboardType keyboardType;
  final ValueChanged<String>? onChanged;

  const _TextField({
    Key? key,
    required this.obscureText,
    required this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: keyboardType == KeyboardType.number
          ? TextInputType.number
          : TextInputType.multiline,
      inputFormatters: keyboardType == KeyboardType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
    );
  }
}
