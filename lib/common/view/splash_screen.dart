import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/logo/logo.png',
              fit: BoxFit.contain,
              width: 160.0,
              height: 160.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Have Custom',
              style: appNameTextStyle,
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Future<void> delay() async {
    Future.delayed(const Duration(seconds: 2), () {
      String startRoute = RouteNames.login;
      Navigator.of(context).popAndPushNamed(startRoute);
    });
  }
}

// import 'package:custom_clothes/common/layout/default_layout.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     checkToken();
//   }
//
//   void checkToken() async {
//     final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
//     final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
//
//     if (refreshToken == null || accessToken == null) {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (_) => LoginScreen(),
//         ),
//             (route) => false,
//       );
//     } else {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (_) => RootTab(),
//         ),
//             (route) => false,
//       );
//     }
//   }
//
//   void deleteToken() async {
//     await storage.deleteAll();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultLayout(
//       backgroundColor: PRIMARY_COLOR,
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'asset/img/logo/logo.png',
//               width: MediaQuery.of(context).size.width / 2,
//             ),
//             const SizedBox(height: 16.0),
//             CircularProgressIndicator(
//               color: Colors.white,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
