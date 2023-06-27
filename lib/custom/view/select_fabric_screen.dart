import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_button_style.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:flutter/material.dart';

class SelectFabricScreen extends StatelessWidget {
  final String id;

  const SelectFabricScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '원단 지정',
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('asset/image/product/$id.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24.0),
                    _CustomContainerButton(
                      title: '원단 종류 지정',
                    ),
                    const SizedBox(height: 16.0),
                    _CustomContainerButton(
                      title: '원단 배합률 지정',
                    ),
                    const SizedBox(height: 16.0),
                    _CustomContainerButton(
                      title: '원단 색상 지정',
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('원단 지정 완료'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomContainerButton extends StatelessWidget {
  final String title;

  const _CustomContainerButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: DEFAULT_TEXT_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(8.0)),
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
              style: bodyBoldTextStyle,
            ),
            const SizedBox(width: 12.0),
            Icon(
              Icons.check_circle,
              color: DARK_GREY_COLOR,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
