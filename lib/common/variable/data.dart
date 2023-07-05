import 'package:custom_clothes/common/model/enum/catetory_label.dart';
import 'package:custom_clothes/common/model/product_model.dart';
import 'package:uuid/uuid.dart';

List<ProductModel> totalProductItems = [
  ProductModel(
    id: Uuid().v4(),
    // id: '1',
    isCompletion: false,
    assetImageName: 'asset/image/product/1.png',
    fileImage: null,
    productName: '초록색을 갖고 있는 보풀 가득한 니트',
    productPrice: 30000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.top,
    ],
  ),
  ProductModel(
    id: Uuid().v4(),
    // id: '2',
    isCompletion: false,
    assetImageName: 'asset/image/product/2.png',
    fileImage: null,
    productName: '핀턱 롱 원피스',
    productPrice: 56000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.top,
    ],
  ),
  ProductModel(
    id: Uuid().v4(),
    // id: '3',
    isCompletion: false,
    assetImageName: 'asset/image/product/3.png',
    fileImage: null,
    productName: '트랙 자켓 캔버스',
    productPrice: 30000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.outer,
    ],
  ),
  ProductModel(
    id: Uuid().v4(),
    // id: '4',
    isCompletion: false,
    assetImageName: 'asset/image/product/4.png',
    fileImage: null,
    productName: '오버핏 반팔 티셔츠',
    productPrice: 16000,
    customPrice: 33000,
    categories: [
      CategoryLabel.recommend,
      CategoryLabel.onePiece,
    ],
  ),
];

List<ProductModel> userProductItems = [];
// List<ProductModel> doingProductItems = [];
// List<ProductModel> completionProductItems = [];
