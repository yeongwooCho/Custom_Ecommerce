import 'package:custom_clothes/common/component/custom_text_form_field.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const subTextStyle = subBodyTextStyle;
    return DefaultLayout(
      appbar: DefaultAppBar(title: '이메일 로그인'),
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
            CustomTextFormField(title: '이메일'),
            const SizedBox(height: 8.0),
            CustomTextFormField(
              title: '비밀번호',
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteNames.root, (route) => false);
              },
              child: Text('이메일로 로그인'),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteNames.emailRegister);
                    },
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteNames.emailFind);
                    },
                    child: Text(
                      '이메일 찾기',
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteNames.emailPasswordReset);
                    },
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
