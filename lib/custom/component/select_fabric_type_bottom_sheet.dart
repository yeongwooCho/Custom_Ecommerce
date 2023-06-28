import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/custom/component/selectable_Item.dart';
import 'package:flutter/material.dart';

class SelectFabricTypeBottomSheet extends StatefulWidget {
  final List<String> fabricItems;
  final List<String> selectedItems;

  const SelectFabricTypeBottomSheet({
    Key? key,
    required this.fabricItems,
    required this.selectedItems,
  }) : super(key: key);

  @override
  State<SelectFabricTypeBottomSheet> createState() => _SelectFabricTypeBottomSheetState();
}

class _SelectFabricTypeBottomSheetState extends State<SelectFabricTypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  children: widget.fabricItems
                      .map(
                        (e) => SelectableItem(
                          isSelected: widget.selectedItems.contains(e),
                          title: e,
                          onTap: () {
                            if (widget.selectedItems.contains(e)) {
                              widget.selectedItems.remove(e);
                            } else {
                              widget.selectedItems.add(e);
                            }
                            print(widget.selectedItems);
                            setState(() {});
                          },
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('원단 종류 지정'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
