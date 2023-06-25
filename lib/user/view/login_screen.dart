import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            // _renderButtons(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteNames.emailLogin);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8.0),
                      Text('이메일로 로그인'),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'asset/image/social_login_button/kakao.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'asset/image/social_login_button/naver.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'asset/image/social_login_button/apple.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'asset/image/social_login_button/google.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.onBoarding, (route) => false);
            // Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.emailLogin, (_) => false);
            // Navigator.of(context).pushNamed(RouteNames.emailLogin);
            // Navigator.of(context).push(RouteNames.emailLogin);
            Navigator.of(context).pushNamed(RouteNames.emailLogin);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 8.0),
              Text('이메일로 로그인'),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Image.asset(
          'asset/image/social_login_button/kakao.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 16.0),
        Image.asset(
          'asset/image/social_login_button/naver.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 16.0),
        Image.asset(
          'asset/image/social_login_button/apple.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 16.0),
        Image.asset(
          'asset/image/social_login_button/google.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
