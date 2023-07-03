class StickerModel {
  final String id;
  final String imagePath;

  StickerModel({
    required this.id,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return (other as StickerModel).id == id;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;
}
