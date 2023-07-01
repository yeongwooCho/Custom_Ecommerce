import 'package:custom_clothes/common/component/custom_product_list.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:flutter/material.dart';

enum CategoryLabel {
  recommend('추천'),
  top('상의'),
  onePiece('원피스'),
  bottom('바지'),
  outer('아우터'),
  skirt('스커트'),
  knitWear('니트웨어'),
  homeWear('홈웨어');

  const CategoryLabel(this.label);

  final String label;
}

//
// List<String> categories = [
//   '추천',
//   '상의',
//   '원피스',
//   '바지',
//   '아우터',
//   '스커트',
//   '니트웨어',
//   '홈웨어',
// ];

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  CategoryLabel selectedCategoryLabel = CategoryLabel.recommend;
  List<Map<String, dynamic>> showItems = [];

  @override
  Widget build(BuildContext context) {
    // category item count
    showItems = totalProductItems
        .where((element) =>
            element['category']!.contains(selectedCategoryLabel.label))
        .toList();

    // grid item size
    int rowCount = (showItems.length ~/ 2) + (showItems.length % 2); // 층의 갯수
    double itemWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double itemHeight = itemWidth / 16 * 27;
    double gridHeight = 0.0;
    if(rowCount != 0) {
      gridHeight = (rowCount * itemHeight) + ((rowCount - 1) * 12);
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '탐색'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                      print('검색');
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              _Categories(
                selectedCategoryLabel: selectedCategoryLabel,
                onTapCategory: onTapCategory,
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                height: gridHeight,
                child: CustomProductListScreen(
                  items: totalProductItems
                      .where((element) => element['category']!
                          .contains(selectedCategoryLabel.label))
                      .toList(),
                  isScroll: false,
                  onTapItem: onTapItem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapItem({required String id}) {
    Navigator.of(context).pushNamed(
      RouteNames.productDetail,
      arguments: ScreenArguments('id', id),
    );
  }

  void onTapCategory({required CategoryLabel selectedCategoryLabel}) {
    setState(() {
      this.selectedCategoryLabel = selectedCategoryLabel;
    });
  }
}

class _Categories extends StatefulWidget {
  final CategoryLabel selectedCategoryLabel;
  final void Function({
    required CategoryLabel selectedCategoryLabel,
  })? onTapCategory;

  const _Categories({
    Key? key,
    required this.selectedCategoryLabel,
    required this.onTapCategory,
  }) : super(key: key);

  @override
  State<_Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<_Categories> {
  @override
  Widget build(BuildContext context) {
    // rowCount
    // crossAxisCount: 2,
    // mainAxisSpacing: 12,
    // crossAxisSpacing: 8,
    // childAspectRatio: 16 / 27,
    // int rowCount = (_items / 2) + (_items % 2) // 층의 갯수
    // double width = (MediaQuery.of(context).size.width - 40) / 2;
    // double height = width / 16 * 27;
    // double gridHeight = (rowCount * height) + ((rowCount -1) * 12);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: CategoryLabel.values
              .map((e) => renderCategory(
                    categoryLabel: e,
                    isSelected: e == widget.selectedCategoryLabel,
                  ))
              .toList()),
    );
  }

  Widget renderCategory({
    required CategoryLabel categoryLabel,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        if (widget.onTapCategory != null) {
          widget.onTapCategory!(selectedCategoryLabel: categoryLabel);
        }
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? PRIMARY_COLOR : null,
              border: isSelected
                  ? null
                  : Border.all(
                      width: 1.5,
                      color: DEFAULT_TEXT_COLOR,
                    ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            alignment: Alignment.center,
            height: 70.0,
            width: 70.0,
            child: Text(
              categoryLabel.label,
              style: isSelected
                  ? bodyBoldWhiteTextStyle.copyWith(fontSize: 16.0)
                  : bodyMediumTextStyle.copyWith(fontSize: 16.0),
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
