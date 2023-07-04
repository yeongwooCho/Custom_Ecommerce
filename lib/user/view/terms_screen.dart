import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isCheckTotalContainer = false;
  bool isCheckLocation = false;
  bool isCheckService = false;
  bool isCheckPersonalInfo = false;
  bool isCheckMarketing = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '이용약관',
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 36.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Have Custom 서비스\n이용약관에 동의해주세요.',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    if (isCheckTotalContainer == true) {
                      isCheckTotalContainer = false;
                      isCheckLocation = false;
                      isCheckService = false;
                      isCheckPersonalInfo = false;
                      isCheckMarketing = false;
                    } else {
                      isCheckTotalContainer = true;
                      isCheckLocation = true;
                      isCheckService = true;
                      isCheckPersonalInfo = true;
                      isCheckMarketing = true;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCheckTotalContainer
                          ? PRIMARY_COLOR
                          : LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 24.0,
                            color: isCheckTotalContainer
                                ? WHITE_TEXT_COLOR
                                : DEFAULT_TEXT_COLOR,
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            '전체 약관에 동의합니다.',
                            style: isCheckTotalContainer
                                ? bodyBoldWhiteTextStyle
                                : bodyBoldTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    isCheckLocation = !isCheckLocation;
                    checkTotal();
                    setState(() {});
                  },
                  child: CustomTerm(
                    isCheck: isCheckLocation,
                    title: '위치 접근 권한 동의(필수)',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isCheckService = !isCheckService;
                    checkTotal();
                    setState(() {});
                  },
                  child: CustomTerm(
                    isCheck: isCheckService,
                    title: '서비스 이용약관 동의(필수)',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isCheckPersonalInfo = !isCheckPersonalInfo;
                    checkTotal();
                    setState(() {});
                  },
                  child: CustomTerm(
                    isCheck: isCheckPersonalInfo,
                    title: '개인정보 수집 및 이용 동의(필수)',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isCheckMarketing = !isCheckMarketing;
                    checkTotal();
                    setState(() {});
                  },
                  child: CustomTerm(
                    isCheck: isCheckMarketing,
                    title: '마케팅 정보 수신 동의(선택)',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed:
                  (isCheckLocation && isCheckService && isCheckPersonalInfo)
                      ? () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RouteNames.root, (route) => false);
                        }
                      : null,
              child: Text('회원가입 완료'),
            ),
          ],
        ),
      ),
    );
  }

  void checkTotal() {
    if (isCheckLocation == true &&
        isCheckService == true &&
        isCheckPersonalInfo == true &&
        isCheckMarketing == true) {
      isCheckTotalContainer = true;
    } else {
      isCheckTotalContainer = false;
    }
  }
}

class CustomTerm extends StatelessWidget {
  final String title;
  final bool isCheck;

  const CustomTerm({
    Key? key,
    required this.title,
    required this.isCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    );
    return Container(
      color: BACKGROUND_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isCheck ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.check,
                      color: isCheck ? WHITE_TEXT_COLOR : DEFAULT_TEXT_COLOR,
                      size: 16.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: textStyle,
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: DEFAULT_TEXT_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
