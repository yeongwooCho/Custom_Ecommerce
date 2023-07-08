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

  String toJson() => label;

  // static CategoryLabel fromJson(String json) => values.byName(json);
  static CategoryLabel? fromJson(String value) {
    switch (value) {
      case '추천':
        return CategoryLabel.recommend;
      case '상의':
        return CategoryLabel.top;
      case '원피스':
        return CategoryLabel.onePiece;
      case '바지':
        return CategoryLabel.bottom;
      case '아우터':
        return CategoryLabel.outer;
      case '스커트':
        return CategoryLabel.skirt;
      case '니트웨어':
        return CategoryLabel.knitWear;
      case '홈웨어':
        return CategoryLabel.homeWear;
      default:
        return null;
    }
  }
}
