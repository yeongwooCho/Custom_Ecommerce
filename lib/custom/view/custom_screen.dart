import 'package:custom_clothes/common/component/custom_product_list.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_button_style.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/custom_buttons_bottom_sheet.dart';
import 'package:custom_clothes/custom/view/custom_guide_screen.dart';
import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  bool isDoing = true;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.customGuide);
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
                  style: isDoing ? null : deactivateButtonStyle,
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
                  style: isDoing ? deactivateButtonStyle : null,
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
              child: isDoing
                  ? doingProductItems.isNotEmpty
                      ? CustomProductListScreen(
                          isScroll: true,
                          items: doingProductItems,
                          onTapItem: onTapItem,
                        )
                      : const Center(
                          child: Text(
                            '커스텀 진행중인 상품이\n존재하지 않습니다.',
                            style: titleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        )
                  : completionProductItems.isNotEmpty
                      ? CustomProductListScreen(
                          isScroll: true,
                          items: completionProductItems,
                          onTapItem: onTapItem,
                        )
                      : const Center(
                          child: Text(
                            '커스텀 완료 된 상품이\n존재하지 않습니다.',
                            style: titleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }

  void onTapItem({required String id}) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => CustomButtonsBottomSheet(
        id: id,
        topButtonTitle: isDoing ? '완료 탭으로 이동' : '구매하기',
        onPressedTopButton: isDoing
            ? () {
                Map<String, dynamic> newEntry = doingProductItems
                    .where((element) => element['id'] == id)
                    .first;
                completionProductItems.add(newEntry);
                doingProductItems.remove(newEntry);
                Navigator.of(context).pop();
                setState(() {});
              }
            : () {
                Navigator.of(context).pushNamed(
                  RouteNames.purchase,
                  arguments: ScreenArguments('id', id),
                );
              },
        bottomButtonTitle: '편집하기',
        onPressedBottomButton: () {
          Navigator.of(context).pushNamed(
            RouteNames.selectFabric,
            arguments: ScreenArguments('id', id),
          );
        },
      ),
    );
  }
}
