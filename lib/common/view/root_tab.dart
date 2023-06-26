import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/custom/view/custom_screen.dart';
import 'package:custom_clothes/mypage/view/mypage_screen.dart';
import 'package:custom_clothes/search/view/search_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  TabController? controller;
  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.cut),
      label: '커스텀',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '탐색',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '마이페이지',
    ),
  ];

  @override
  void initState() {
    super.initState();

    controller = TabController(length: getItems().length, vsync: this);
    controller?.addListener(tabListener);
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: renderBottomNavigationBar(),
      child: Center(
        child: TabBarView(
          controller: controller,
          children: [
            CustomScreen(),
            SearchScreen(),
            MypageScreen(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (int index) {
        controller?.animateTo(index);
      },
      items: getItems(),
      currentIndex: controller!.index,
    );
  }

  List<BottomNavigationBarItem> getItems(){
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.cut),
        label: '커스텀',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: '탐색',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '마이페이지',
      ),
    ];
  }

  void tabListener() {
    setState(() {});
  }
}
