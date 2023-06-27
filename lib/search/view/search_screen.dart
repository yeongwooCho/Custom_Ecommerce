import 'package:custom_clothes/common/component/custom_product_list.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/const/custom_text_style.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _items = [
    '안녕 as df',
    '안녕 xc v',
    '안녕 as df',
    '안녕 as df',
    '안녕 xc v',
  ];

  @override
  Widget build(BuildContext context) {
    int rowCount = (_items.length ~/ 2) + (_items.length % 2); // 층의 갯수
    double itemWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double itemHeight = itemWidth / 16 * 27;
    double gridHeight = (rowCount * itemHeight) + ((rowCount - 1) * 12);
    return DefaultLayout(
      appbar: DefaultAppBar(title: '탐색'),
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
              _Categories(),
              const SizedBox(height: 24.0),
              SizedBox(
                height: gridHeight,
                child: CustomProductListScreen(
                  items: _items,
                  isScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Categories extends StatefulWidget {
  const _Categories({Key? key}) : super(key: key);

  @override
  State<_Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<_Categories> {
  String isSelectedItem = '추천';
  List<String> categorie = [
    '추천',
    '상의',
    '원피스',
    '바지',
    '아우터',
    '스커트',
    '니트웨어',
    '홈웨어',
  ];

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
          children: categorie
              .map((e) => renderCategory(
                    title: e,
                    isSelected: e == isSelectedItem,
                  ))
              .toList()),
    );
  }

  Widget renderCategory({required String title, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        isSelectedItem = title;
        setState(() {});
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
              title,
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
