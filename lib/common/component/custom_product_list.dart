import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/variable/format.dart';
import 'package:flutter/material.dart';

class CustomProductListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final bool isScroll;
  final void Function({required String id})? onTapItem;

  const CustomProductListScreen({
    Key? key,
    required this.items,
    required this.isScroll,
    required this.onTapItem,
  }) : super(key: key);

  @override
  State<CustomProductListScreen> createState() =>
      _CustomProductListScreenState();
}

class _CustomProductListScreenState extends State<CustomProductListScreen> {
  @override
  Widget build(BuildContext context) {
    // int rowCount = (widget.items.length ~/ 2) + (widget.items.length % 2); // 층의 갯수
    double itemWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double itemHeight = itemWidth / 16 * 27;
    double footerHeight = itemHeight - itemWidth;
    return GridView.builder(
      physics: widget.isScroll ? null : NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 16 / 27,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            // widget.onTapItem!(id: '${index + 1}');
            widget.onTapItem!(id: widget.items[index]['id']);
          },
          child: GridTile(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'asset/image/product/${widget.items[index]['image_name']}',
                fit: BoxFit.contain,
              ),
            ),
            footer: Container(
              height: footerHeight,
              child: GridTileBar(
                backgroundColor: BACKGROUND_COLOR,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.items[index]['productName'],
                      style: productTitleStyle,
                      maxLines: 2,
                    ),
                    Text(
                      '${numberFormat.format(widget.items[index]['productPrice'])} 원',
                      style: productMoneyStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
