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
}
