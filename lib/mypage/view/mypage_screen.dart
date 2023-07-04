import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  bool isPushNotification = true;

  @override
  Widget build(BuildContext context) {
    const textStyle = bodyBoldTextStyle;
    return DefaultLayout(
      appbar: DefaultAppBar(title: '내정보'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '안녕하세요 김00님!',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '푸시알림 설정',
                        style: textStyle,
                      ),
                      CupertinoSwitch(
                        activeColor: PRIMARY_COLOR,
                        value: isPushNotification,
                        onChanged: (bool value) {
                          setState(() {
                            isPushNotification = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '앱 버전',
                        style: textStyle,
                      ),
                      Text(
                        'v 2.3.1',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10.0,
            width: double.infinity,
            color: LIGHT_GREY_COLOR,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                getListCard(
                  title: '회원 정보 수정',
                  style: textStyle,
                ),
                getListCard(
                  title: '결제 이력 관리',
                  style: textStyle,
                ),
                getListCard(
                  title: '결제 정보 수정',
                  style: textStyle,
                ),
                getListCard(
                  title: '고객센터',
                  style: textStyle,
                ),
                getListCard(
                    title: '로그아웃',
                    style: textStyle,
                    onTap: () {
                      print(1);
                      _showLogoutDialog();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getListCard({
    required String title,
    TextStyle? style,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: style),
              const Icon(
                Icons.chevron_right,
                color: DEFAULT_TEXT_COLOR,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("로그아웃"),
          content: const Text("로그아웃을 원하시면 로그아웃 버튼을 눌러주세요."),
          actions: <Widget>[
            TextButton(
              child: const Text("로그아웃"),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.login,
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
