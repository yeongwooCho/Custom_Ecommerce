import 'package:custom_clothes/common/component/custom_product_list.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/custom/view/custom_guide_screen.dart';
import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  bool isDoing = true;

  List<String> doingItems = [
    '1',
    '2',
  ];
  List<String> completeItems = [
    '1',
    '2',
    '3',
    '4',
  ];

  @override
  Widget build(BuildContext context) {
    ButtonStyle deactivateStyle = ElevatedButton.styleFrom(
      foregroundColor: DARK_GREY_COLOR,
      backgroundColor: LIGHT_GREY_COLOR,
    );

    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (_) => CustomGuideScreen(),
          );
        },
        backgroundColor: PRIMARY_COLOR,
        child: const Icon(
          Icons.question_mark_rounded,
          size: 36.0,
        ),
      ),
      appbar: const DefaultAppBar(
        title: '커스텀',
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    isDoing = true;
                    setState(() {});
                  },
                  style: isDoing ? null : deactivateStyle,
                  child: const SizedBox(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle),
                        SizedBox(width: 8.0),
                        Text('진행중'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    isDoing = false;
                    setState(() {});
                  },
                  style: isDoing ? deactivateStyle : null,
                  child: const SizedBox(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle),
                        SizedBox(width: 8.0),
                        Text('완료'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: CustomProductListScreen(
                isScroll: true,
                items: isDoing ? doingItems : completeItems,
              ),
            )
          ],
        ),
      ),
    );
  }
}
