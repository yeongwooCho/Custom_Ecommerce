import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final Widget? leading;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.action,
  }) : super(key: key);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: bodyBoldTextStyle
      ),
      leading: widget.leading,
      centerTitle: true,
      actions: widget.action,
      elevation: 0.3,
      backgroundColor: BACKGROUND_COLOR,
      foregroundColor: DEFAULT_TEXT_COLOR,
    );
  }
}
