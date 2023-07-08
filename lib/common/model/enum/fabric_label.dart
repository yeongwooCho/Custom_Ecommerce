enum FabricLabel {
  a('코튼(면)'),
  b('울(양모)'),
  c('나일론'),
  d('아크릴'),
  e('실크'),
  f('레이온'),
  g('폴리에스테르'),
  h('시폰'),
  i('퍼'),
  j('리넨(마)'),
  k('실켓'),
  l('데님'),
  m('레이스'),
  n('텐셀'),
  o('쭈리면'),
  p('옥스퍼드'),
  q('앙고라'),
  r('분또'),
  s('보카시'),
  t('트위드'),
  u('코듀로이'),
  v('스웨이드'),
  w('자카드'),
  x('기모');

  const FabricLabel(this.label);

  final String label;

  String toJson() => label;

  // static FabricLabel fromJson(String json) => values.byName(json);
  static FabricLabel? fromJson(String value) {
    switch (value) {
      case '코튼(면)':
        return FabricLabel.a;
      case '울(양모)':
        return FabricLabel.b;
      case '나일론':
        return FabricLabel.c;
      case '아크릴':
        return FabricLabel.d;
      case '실크':
        return FabricLabel.e;
      case '레이온':
        return FabricLabel.f;
      case '폴리에스테르':
        return FabricLabel.g;
      case '시폰':
        return FabricLabel.h;
      case '퍼':
        return FabricLabel.i;
      case '리넨(마)':
        return FabricLabel.j;
      case '실켓':
        return FabricLabel.k;
      case '데님':
        return FabricLabel.l;
      case '레이스':
        return FabricLabel.m;
      case '텐셀':
        return FabricLabel.n;
      case '쭈리면':
        return FabricLabel.o;
      case '옥스퍼드':
        return FabricLabel.p;
      case '앙고라':
        return FabricLabel.q;
      case '분또':
        return FabricLabel.r;
      case '보카시':
        return FabricLabel.s;
      case '트위드':
        return FabricLabel.t;
      case '코듀로이':
        return FabricLabel.u;
      case '스웨이드':
        return FabricLabel.v;
      case '자카드':
        return FabricLabel.w;
      case '기모':
        return FabricLabel.x;
      default:
        return null;
    }
  }
}

// extension FabricLabelExtension on FabricLabel {
//   String toJson() => label;
//
//   FabricLabel? fromJson(String value) {
//     switch (value) {
//       case '코튼(면)':
//         return FabricLabel.a;
//       case '울(양모)':
//         return FabricLabel.b;
//       case '나일론':
//         return FabricLabel.c;
//       case '아크릴':
//         return FabricLabel.d;
//       case '실크':
//         return FabricLabel.e;
//       case '레이온':
//         return FabricLabel.f;
//       case '폴리에스테르':
//         return FabricLabel.g;
//       case '시폰':
//         return FabricLabel.h;
//       case '퍼':
//         return FabricLabel.i;
//       case '리넨(마)':
//         return FabricLabel.j;
//       case '실켓':
//         return FabricLabel.k;
//       case '데님':
//         return FabricLabel.l;
//       case '레이스':
//         return FabricLabel.m;
//       case '텐셀':
//         return FabricLabel.n;
//       case '쭈리면':
//         return FabricLabel.o;
//       case '옥스퍼드':
//         return FabricLabel.p;
//       case '앙고라':
//         return FabricLabel.q;
//       case '분또':
//         return FabricLabel.r;
//       case '보카시':
//         return FabricLabel.s;
//       case '트위드':
//         return FabricLabel.t;
//       case '코듀로이':
//         return FabricLabel.u;
//       case '스웨이드':
//         return FabricLabel.v;
//       case '자카드':
//         return FabricLabel.w;
//       case '기모':
//         return FabricLabel.x;
//       default:
//         return null;
//     }
//   }
// }
