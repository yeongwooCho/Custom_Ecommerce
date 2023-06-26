import 'package:custom_clothes/common/component/custom_text_form_field.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EmailFindScreen extends StatelessWidget {
  const EmailFindScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '아이디 찾기',
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '아이디 찾기를 위해\n휴대폰 인증을 해주세요',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 36.0),
                CustomTextFormField(
                  title: '휴대폰 번호',
                  buttonText: '인증번호 받기',
                  onPressed: () {},
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('아이디 찾기'),
            ),
          ],
        ),
      ),
    );
  }
}
