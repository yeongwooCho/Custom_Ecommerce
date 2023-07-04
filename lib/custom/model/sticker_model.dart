class StickerModel {
  final String id;
  final String imagePath;

  StickerModel({
    required this.id,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) {
    return (other as StickerModel).id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
