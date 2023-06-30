import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/custom/component/custom_container_button.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/select_fabric_color_bottom_sheet.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/select_fabric_mixing_ratio_bottom_sheet.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/select_fabric_type_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SelectFabricScreen extends StatefulWidget {
  final String id;

  const SelectFabricScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SelectFabricScreen> createState() => _SelectFabricScreenState();
}

class _SelectFabricScreenState extends State<SelectFabricScreen> {
  List<String> fabricItems = [
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
  List<String> selectedItems = [];
  List<double> selectedMixingRatioValues = [];
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
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
              Image.asset('asset/image/product/${widget.id}.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24.0),
                    CustomContainerButton(
                      title: '원단 종류 지정',
                      isSelected: selectedItems.isNotEmpty,
                      onTap: () {
                        showTypeModal(context: context);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomContainerButton(
                      title: '원단 배합률 지정',
                      isSelected: selectedMixingRatioValues.isNotEmpty,
                      onTap: selectedItems.isEmpty
                          ? null
                          : () {
                              showMixingRatioModal(context: context);
                            },
                    ),
                    const SizedBox(height: 16.0),
                    CustomContainerButton(
                      title: '원단 색상 지정',
                      isSelected: selectedColor != null,
                      onTap: () {
                        (selectedItems.isEmpty ||
                                selectedMixingRatioValues.isEmpty)
                            ? null
                            : showColorModal(context: context);
                      },
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: (selectedItems.isNotEmpty &&
                              selectedMixingRatioValues.isNotEmpty &&
                              selectedColor != null)
                          ? () {
                              Navigator.of(context).pushNamed(
                                RouteNames.printing,
                                arguments: ScreenArguments('id', widget.id),
                              );
                            }
                          : null,
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

  void showTypeModal({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => SelectFabricTypeBottomSheet(
        fabricItems: fabricItems,
        selectedItems: selectedItems,
        popBottomSheet: popBottomSheet,
      ),
    );
  }

  void showMixingRatioModal({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => SelectFabricMixingRatioBottomSheet(
        selectedItems: selectedItems,
        selectedMixingRatioValues: selectedMixingRatioValues,
        popBottomSheet: popBottomSheet,
      ),
    );
  }

  void showColorModal({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => SelectFabricColorBottomSheet(
        selectColor: selectColor,
        popBottomSheet: popBottomSheet,
      ),
    );
  }

  void selectColor({
    required Color color,
  }) {
    selectedColor = color;
    setState(() {});
  }

  void popBottomSheet() {
    Navigator.of(context).pop();
    setState(() {});
  }
}
