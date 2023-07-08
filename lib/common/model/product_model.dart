import 'package:custom_clothes/common/model/enum/catetory_label.dart';
import 'package:custom_clothes/common/model/enum/fabric_label.dart';

class ProductModel {
  String id;
  bool isCompletion;
  String? assetImageName;
  String? fileImage;
  String productName;
  int productPrice;
  int customPrice;
  List<CategoryLabel> categories;
  Map<FabricLabel, int> fabrics;

  ProductModel({
    required this.id,
    required this.isCompletion,
    required this.assetImageName,
    required this.fileImage,
    required this.productName,
    required this.productPrice,
    required this.customPrice,
    required this.categories,
    required this.fabrics,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isCompletion': isCompletion ? '1' : '0',
      'assetImageName': assetImageName,
      'fileImage': fileImage,
      'productName': productName,
      'productPrice': productPrice,
      'customPrice': customPrice,
      'categories': categories.map((e) => e.toJson()).toList(),
      'fabrics': fabrics.map((key, value) => MapEntry(key.toJson(), value)),
    };
  }

  factory ProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ProductModel(
      id: json['id'],
      isCompletion: json['isCompletion'] == '1' ? true : false,
      assetImageName: json['assetImageName'],
      fileImage: json['fileImage'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      customPrice: json['customPrice'],
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryLabel.fromJson(e)!)
          .toList(),
      fabrics: (json['fabrics'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(
                FabricLabel.fromJson(key)!,
                value as int,
              )),
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, isCompletion: $isCompletion, assetImageName: $assetImageName, fileImage: $fileImage, productName: $productName, productPrice:$productPrice, customPrice: $customPrice, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return (other as ProductModel).id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
