import 'package:custom_clothes/common/model/enum/catetory_label.dart';
import 'package:custom_clothes/common/model/product_model.dart';

List<Map<String, dynamic>> totalProductItems = [
  {
    'id': '1',
    'image_name': '1.png',
    'productName': '초록색을 갖고 있는 보풀 가득한 니트',
    'productPrice': 30000,
    'customPrice': 33000,
    'category': '추천, 상의'
  },
  {
    'id': '2',
    'image_name': '2.png',
    'productName': '핀턱 롱 원피스',
    'productPrice': 56000,
    'customPrice': 33000,
    'category': '추천, 상의'
  },
  {
    'id': '3',
    'image_name': '3.png',
    'productName': '트랙 자켓 캔버스',
    'productPrice': 30000,
    'customPrice': 33000,
    'category': '추천 아우터'
  },
  {
    'id': '4',
    'image_name': '4.png',
    'productName': '오버핏 반팔 티셔츠',
    'productPrice': 16000,
    'customPrice': 33000,
    'category': '추천 원피스'
  },
];

List<Map<String, dynamic>> doingProductItems = [];
List<Map<String, dynamic>> completionProductItems = [];

List<ProductModel> totalProductItems1 = [
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
List<ProductModel> doingProductItems1 = [];
List<ProductModel> completionProductItems1 = [];
