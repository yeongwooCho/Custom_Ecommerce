import 'package:custom_clothes/common/component/custom_text_form_field.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({Key? key}) : super(key: key);

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  bool isPhone = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '회원가입',
      ),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
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
                        children: [
                          CustomTextFormField(
                            title: '이메일',
                            buttonText: "중복확인",
                            onPressed: () {},
                          ),
                          const SizedBox(height: 8.0),
                          CustomTextFormField(
                            title: '비밀번호',
                          ),
                          const SizedBox(height: 8.0),
                          CustomTextFormField(
                            title: '비밀번호 확인',
                          ),
                          const SizedBox(height: 8.0),
                          CustomTextFormField(
                            title: '휴대폰 번호',
                            buttonText: "인증번호 받기",
                            onPressed:
                                isPhone ? null : onPressedVerificationCode,
                          ),
                          if (isPhone == true)
                            CustomTextFormField(
                              buttonText: "인증번호 확인",
                              onPressed: () {},
                            ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(height: 24),
                      ),
                      ElevatedButton(
                        onPressed: isPhone ? () {
                          Navigator.of(context).pushNamed(RouteNames.terms);
                        } : null,
                        child: Text('회원가입'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onPressedVerificationCode() {
    setState(() {
      isPhone = true;
    });
  }

  Widget ZXCVZXCV() {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
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
                      children: [
                        CustomTextFormField(
                          title: '이메일',
                          buttonText: "중복확인",
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          title: '비밀번호',
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          title: '비밀번호 확인',
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          title: '휴대폰 번호',
                          buttonText: "인증번호 받기",
                          onPressed: isPhone ? null : onPressedVerificationCode,
                        ),
                        if (isPhone == true)
                          CustomTextFormField(
                            buttonText: "인증번호 확인",
                            onPressed: () {},
                          ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    ElevatedButton(
                      onPressed: isPhone ? () {} : null,
                      child: Text('회원가입'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
