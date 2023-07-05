import 'package:flutter/material.dart';

class TextStickerModel {
  final String id;
  final String text;
  final TextStyle textStyle;

  TextStickerModel({
    required this.id,
    required this.text,
    required this.textStyle,
  });

  @override
  bool operator ==(Object other) {
    return (other as TextStickerModel).id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
