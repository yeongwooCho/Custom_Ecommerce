import 'package:custom_clothes/common/component/custom_text_form_field.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      color: DARK_GREY_COLOR,
    );
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'asset/image/logo/logo.png',
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
            CustomTextField(title: '이메일'),
            const SizedBox(height: 8.0),
            CustomTextField(title: '비밀번호'),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('이메일로 로그인'),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '회원가입',
                      style: subTextStyle,
                    ),
                  ),
                ),
                Container(
                  color: DARK_GREY_COLOR,
                  width: 1.0,
                  height: 14.0,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '아이디 찾기',
                      style: subTextStyle,
                    ),
                  ),
                ),
                Container(
                  color: DARK_GREY_COLOR,
                  width: 1.0,
                  height: 14.0,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '비밀번호 초기화',
                      style: subTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
