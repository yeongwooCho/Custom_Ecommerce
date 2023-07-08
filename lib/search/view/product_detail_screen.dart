import 'package:custom_clothes/common/component/divide_line.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/product_model.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:custom_clothes/common/variable/format.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;

  const ProductDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel selectedItem =
        totalProductItems.where((element) => element.id == id).first;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (selectedItem.assetImageName != null)
                  Image.asset(selectedItem.assetImageName!),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        selectedItem.productName,
                        style: productTitleStyle.copyWith(fontSize: 20.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${numberFormat.format(selectedItem.productPrice)} 원',
                        style: productMoneyStyle.copyWith(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
                const DivideLine(),
                // TODO: 여기 상세 이미지 수정해야 함.
                ProductDetailDescriptionScreen(id: id),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: SizedBox(
                    height: 300.0,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: BACKGROUND_COLOR,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    ProductModel newEntry = totalProductItems
                        .where((element) => element.id == id)
                        .first;
                    ProductModel newProduct = ProductModel(
                      id: Uuid().v4(),
                      isCompletion: false,
                      assetImageName: newEntry.assetImageName,
                      fileImage: newEntry.fileImage,
                      productName: newEntry.productName,
                      productPrice: newEntry.productPrice,
                      customPrice: newEntry.customPrice,
                      categories: newEntry.categories,
                      fabrics: {},
                    );
                    userProductItems.add(newProduct);
                    // TODO: 여기서 setPreferenceData
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.root,
                      (route) => false,
                    );
                  },
                  child: const Text('커스텀으로 이동하기'),
                ),
              ),
            ),
          ),
        ],
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
          7,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Image.asset(
                    'asset/image/product_detail/$id/$id-$index.JPG'),
              )),
    );
  }
}
