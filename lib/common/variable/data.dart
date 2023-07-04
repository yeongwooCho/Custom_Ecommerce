import 'package:custom_clothes/common/model/enum/catetory_label.dart';
import 'package:custom_clothes/common/model/product_model.dart';

List<ProductModel> totalProductItems = [
  ProductModel(
    id: '1',
    assetImageName: 'asset/image/product/1.png',
    fileImageName: null,
    productName: '초록색을 갖고 있는 보풀 가득한 니트',
    productPrice: 30000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.top,
    ],
  ),
  ProductModel(
    id: '2',
    assetImageName: 'asset/image/product/2.png',
    fileImageName: null,
    productName: '핀턱 롱 원피스',
    productPrice: 56000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.top,
    ],
  ),
  ProductModel(
    id: '3',
    assetImageName: 'asset/image/product/3.png',
    fileImageName: null,
    productName: '트랙 자켓 캔버스',
    productPrice: 30000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.outer,
    ],
  ),
  ProductModel(
    id: '4',
    assetImageName: 'asset/image/product/4.png',
    fileImageName: null,
    productName: '오버핏 반팔 티셔츠',
    productPrice: 16000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.onePiece,
    ],
  ),
];
List<ProductModel> doingProductItems = [];
List<ProductModel> completionProductItems = [];
