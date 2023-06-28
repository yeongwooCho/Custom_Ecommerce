import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/custom/component/selectable_Item.dart';
import 'package:flutter/material.dart';

class SelectFabricScreen extends StatelessWidget {
  final String id;

  const SelectFabricScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> fabricData = [
      '코튼(면)',
      '울(양모)',
      '나일론',
      '아크릴',
      '실크',
      '레이온',
      '폴리에스테르',
      '시폰',
      '퍼',
      '리넨(마)',
      '실켓',
      '데님',
      '레이스',
      '텐셀',
      '쭈리면',
      '옥스퍼드',
      '앙고라',
      '분또',
      '보카시',
      '트위드',
      '코듀로이',
      '스웨이드',
      '자카드',
      '기모',
    ];

    return DefaultLayout(
      appbar: const DefaultAppBar(
        title: '원단 지정',
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('asset/image/product/$id.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24.0),
                    _CustomContainerButton(
                      title: '원단 종류 지정',
                      onTap: () {
                        showTypeModal(
                          context: context,
                          fabricData: fabricData,
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    _CustomContainerButton(
                      title: '원단 배합률 지정',
                      onTap: () {
                        showMixingRatioModal(context: context);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    _CustomContainerButton(
                      title: '원단 색상 지정',
                      onTap: () {
                        showColorModal(context: context);
                      },
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('원단 지정 완료'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTypeModal({
    required BuildContext context,
    required List<String> fabricData,
  }) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => Column(
        children: [
          Expanded(
            child: Container(
              color: EMPTY_COLOR,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    runSpacing: 8,
                    runAlignment: WrapAlignment.start,
                    children: fabricData
                        .map(
                          (e) => SelectableItem(
                            isSelected: false,
                            title: e,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('원단 종류 지정'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMixingRatioModal({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Center(
        child: Text('asdf'),
      ),
    );
  }

  void showColorModal({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Center(
        child: Text('asdf'),
      ),
    );
  }
}

class _CustomContainerButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const _CustomContainerButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: DEFAULT_TEXT_COLOR,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 24.0,
                height: 24.0,
              ),
              Text(
                title,
                style: bodyBoldTextStyle,
              ),
              const SizedBox(width: 12.0),
              Icon(
                Icons.check_circle,
                color: DARK_GREY_COLOR,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
