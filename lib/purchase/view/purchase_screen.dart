import 'package:custom_clothes/common/component/divide_line.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:custom_clothes/custom/component/drop_down_menu.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  final String id;

  const PurchaseScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(
        title: '주문서 작성',
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: _Address(),
            ),
            DivideLine(),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: _ProductInfo(id: id),
            ),
            DivideLine(),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: _SizeAmount(),
            ),
            DivideLine(),
            Container(
              height: 300.0,
            ),
            DivideLine(),
          ],
        ),
      ),
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '수령인',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                '홍길동',
                style: bodyBoldTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '휴대폰',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                '010 2711 1995',
                style: bodyBoldTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '휴대폰',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('우편번호 찾기'),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '주소지',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '상세 주소',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '배송 메모',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final String id;

  const _ProductInfo({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> selectedItem =
        totalProductItems
            .where((element) => element['id'] == id)
            .first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '상품 정보',
          style: titleTextStyle,
        ),
        const SizedBox(height: 24.0),
        Row(
          children: [
            Image.asset(
              'asset/image/product/${selectedItem['image_name']}',
              height: 150.0,
              width: 150.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    selectedItem['productName']!,
                    style: bodyBoldTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '코튼(면)',
                      ),
                      Text('17%'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('폴리우레탄'),
                      Text('47%'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('레이온'),
                      Text('5%'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('리넨(마)'),
                      Text('31%'),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _SizeAmount extends StatefulWidget {
  const _SizeAmount({Key? key}) : super(key: key);

  @override
  State<_SizeAmount> createState() => _SizeAmountState();
}

class _SizeAmountState extends State<_SizeAmount> {
  SizeLabel? selectedSize;
  String? selectedAmount;
  List<Map<String, String>> selectedSizeAmount = [];

  void onSelectedSize(SizeLabel? size) {
    setState(() {
      if (selectedAmount != null) {
        selectedSizeAmount.add({
          'size': '${size?.label}',
          'amount': '$selectedAmount',
        });
        selectedSize = null;
        selectedAmount = null;
      } else {
        selectedSize = size;
      }
    });
  }

  void onSelectedAmount(String? amount) {
    setState(() {
      if (selectedSize != null) {
        selectedSizeAmount.add({
          'size': '${selectedSize?.label}',
          'amount': '$amount',
        });
        selectedSize = null;
        selectedAmount = null;
      } else {
        selectedAmount = amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '사이즈 및 수량',
          style: titleTextStyle,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '사이즈',
                    style: bodyMediumTextStyle,
                  ),
                  const SizedBox(height: 4.0),
                  DropdownMenuWidget(
                    isSize: true,
                    onSelectedSize: onSelectedSize,
                    onSelectedAmount: onSelectedAmount,
                    selectedSize: selectedSize,
                    selectedAmount: selectedAmount,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '수량',
                    style: bodyMediumTextStyle,
                  ),
                  const SizedBox(height: 4.0),
                  DropdownMenuWidget(
                    isSize: false,
                    onSelectedSize: onSelectedSize,
                    onSelectedAmount: onSelectedAmount,
                    selectedSize: selectedSize,
                    selectedAmount: selectedAmount,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: MIDDLE_GREY_COLOR,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: selectedSizeAmount.map((entry) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry['size']!,
                        style: bodyMediumTextStyle,
                      ),
                      Text(
                        '${entry['amount']!} 개',
                        style: bodyMediumTextStyle,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
