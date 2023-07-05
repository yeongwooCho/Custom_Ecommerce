import 'package:custom_clothes/common/model/enum/catetory_label.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String id;
  String? assetImageName;
  String? fileImage;
  String productName;
  int productPrice;
  int customPrice;
  List<CategoryLabel> categories;

  ProductModel({
    required this.id,
    required this.assetImageName,
    required this.fileImage,
    required this.productName,
    required this.productPrice,
    required this.customPrice,
    required this.categories,
  });
}
