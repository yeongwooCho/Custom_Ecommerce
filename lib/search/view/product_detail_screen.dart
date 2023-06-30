import 'package:custom_clothes/common/component/divide_line.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;

  const ProductDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> selectedItem =
        totalProductItems.where((element) => element['id'] == id).first;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('asset/image/product/${selectedItem['image_name']}'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    selectedItem['productName']!,
                    style: productTitleStyle.copyWith(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '₩${selectedItem['productPrice']!}원',
                    style: productMoneyStyle.copyWith(fontSize: 24.0),
                  ),
                ],
              ),
            ),
            const DivideLine(),
            ProductDetailDescriptionScreen(id: '1'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Map<String, String> newEntry = totalProductItems
                      .where((element) => element['id'] == id)
                      .first;
                  doingProductItems.add(newEntry);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteNames.root,
                    (route) => false,
                  );
                },
                child: const Text('커스텀으로 이동하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailDescriptionScreen extends StatelessWidget {
  final String id;

  const ProductDetailDescriptionScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          11,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child:
                    Image.asset('asset/image/product_detail/${id}_$index.JPG'),
              )),
    );
  }
}
