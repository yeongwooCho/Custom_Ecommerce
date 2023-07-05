import 'dart:io';

import 'package:custom_clothes/common/model/product_model.dart';
import 'package:flutter/material.dart';

class CustomFlexibleImage extends StatelessWidget {
  final ProductModel product;

  // final bool isFlexible;

  const CustomFlexibleImage({
    Key? key,
    required this.product,
    // required this.isFlexible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return product.fileImage != null
        ? Image.file(
            File(product.fileImage!),
            fit: BoxFit.contain,
          )
        : product.assetImageName != null
            ? Image.asset(
                product.assetImageName!,
                fit: BoxFit.contain,
              )
            : Container();
  }
}
