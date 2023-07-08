import 'package:custom_clothes/common/component/custom_flexible_image.dart';
import 'package:custom_clothes/common/component/divide_line.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/enum/fabric_label.dart';
import 'package:custom_clothes/common/model/product_model.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:custom_clothes/common/variable/format.dart';
import 'package:custom_clothes/custom/component/drop_down_menu.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  final String id;

  const PurchaseScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  int amount = 0;

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
              child: _ProductInfo(id: widget.id),
            ),
            DivideLine(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              // child: _SizeAmount(amount: amount, totalAmount: (int amount){
              //   this.amount = amount;
              // }),
              child: _SizeAmount(
                totalAmount: ({required int amount}) {
                  setState(() {
                    this.amount = amount;
                  });
                },
              ),
            ),
            DivideLine(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: _TotalPayment(
                id: widget.id,
                amount: amount,
              ),
            ),
            DivideLine(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: PurchaseTerms(),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  userProductItems = userProductItems
                      .where((element) => element.id != widget.id)
                      .toList();
                  // TODO: 여기서 setPreferenceData
                  Navigator.of(context).pushNamed(
                    RouteNames.completion,
                    arguments: ScreenArguments('title', '결제가 완료되었습니다!'),
                  );
                },
                child: const Text('결제하기'),
              ),
            ),
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
        Text(
          '배송지 정보',
          style: titleTextStyle,
        ),
        const SizedBox(height: 16.0),
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
        const SizedBox(height: 16.0),
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
        const SizedBox(height: 16.0),
        Row(
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                '우편번호',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('우편번호 찾기'),
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
                '주소지',
                style: bodyMediumTextStyle,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
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
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
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
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
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
    ProductModel productItem =
        userProductItems.where((element) => element.id == id).first;

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
            SizedBox(
              height: 150.0,
              width: 150.0,
              child: CustomFlexibleImage(
                product: productItem,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    productItem.productName,
                    style: bodyBoldTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  ...productItem.fabrics.entries.map((entry) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.key.label),
                        Text('${entry.value} %'),
                      ],
                    );
                  }),
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
  final void Function({required int amount})? totalAmount;

  const _SizeAmount({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<_SizeAmount> createState() => _SizeAmountState();
}

class _SizeAmountState extends State<_SizeAmount> {
  SizeLabel? selectedSize;
  String? selectedAmount;
  Set<Map<String, String>> selectedSizeAmount = {};

  void onSelectedSize(SizeLabel? size) {
    setState(() {
      if (selectedAmount != null) {
        selectedSizeAmount = selectedSizeAmount
            .where((element) => element['size'] != size?.label)
            .toSet();
        selectedSizeAmount.add({
          'size': '${size?.label}',
          'amount': '$selectedAmount',
        });

        selectedSize = null;
        selectedAmount = null;
      } else {
        selectedSize = size;
      }
      calculateAmount();
    });
  }

  void onSelectedAmount(String? amount) {
    setState(() {
      if (selectedSize != null) {
        selectedSizeAmount = selectedSizeAmount
            .where((element) => element['size'] != selectedSize?.label)
            .toSet();
        selectedSizeAmount.add({
          'size': '${selectedSize?.label}',
          'amount': '$amount',
        });
        selectedSize = null;
        selectedAmount = null;
      } else {
        selectedAmount = amount;
      }
      calculateAmount();
    });
  }

  void calculateAmount() {
    if (selectedSizeAmount.isNotEmpty) {
      int realtimeAmount = selectedSizeAmount.map((e) {
        try {
          int amount = int.parse(e['amount']!);
          return amount;
        } catch (error) {
          return 0;
        }
      }).reduce((value, element) => value + element);
      widget.totalAmount!(amount: realtimeAmount);
    }
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

class _TotalPayment extends StatelessWidget {
  final String id;
  final int amount;

  const _TotalPayment({
    Key? key,
    required this.id,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel productItem =
        userProductItems.where((element) => element.id == id).first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '최종 결제 금액',
          style: titleTextStyle,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '상품 금액',
              style: bodyMediumTextStyle,
            ),
            Text(
              '${numberFormat.format(productItem.productPrice)} 원',
              style: bodyMediumTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '커스텀 금액',
              style: bodyMediumTextStyle,
            ),
            Text(
              '${numberFormat.format(productItem.customPrice)} 원',
              style: bodyMediumTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '배송비',
              style: bodyMediumTextStyle,
            ),
            Text(
              '0 원',
              style: bodyMediumTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '수량',
              style: bodyMediumTextStyle,
            ),
            Text(
              '$amount 개',
              style: bodyMediumTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '최종 결제 금액',
              style: bodyBoldTextStyle,
            ),
            Text(
              '${numberFormat.format((productItem.productPrice + productItem.customPrice) * amount)} 원',
              style: bodyBoldTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class PurchaseTerms extends StatefulWidget {
  const PurchaseTerms({Key? key}) : super(key: key);

  @override
  State<PurchaseTerms> createState() => _PurchaseTermsState();
}

class _PurchaseTermsState extends State<PurchaseTerms> {
  bool isAgreePurchase = true;
  bool isAgreeCancellation = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            isAgreePurchase = !isAgreePurchase;
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: isAgreePurchase ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.check,
                        color: isAgreePurchase
                            ? WHITE_TEXT_COLOR
                            : DEFAULT_TEXT_COLOR,
                        size: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '주문 내용 확인 및 결제 내용 동의(필수)',
                    style: bodyBoldTextStyle.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
              const Text(
                '보기',
                style: subBodyTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            isAgreeCancellation = !isAgreeCancellation;
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: isAgreeCancellation
                          ? PRIMARY_COLOR
                          : LIGHT_GREY_COLOR,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.check,
                        color: isAgreeCancellation
                            ? WHITE_TEXT_COLOR
                            : DEFAULT_TEXT_COLOR,
                        size: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '취소 / 교환 / 반품 정책 동의(필수)',
                    style: bodyBoldTextStyle.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
              // const Icon(
              //   Icons.chevron_right,
              //   color: DEFAULT_TEXT_COLOR,
              // )
              const Text(
                '보기',
                style: subBodyTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
