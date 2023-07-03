import 'dart:io';

import 'package:custom_clothes/common/view/completion_screen.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/custom/component/custom_container_button.dart';
import 'package:custom_clothes/custom/component/sticker.dart';
import 'package:custom_clothes/custom/model/sticker_model.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/printing_add_text_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PrintingScreen extends StatefulWidget {
  final String id;

  const PrintingScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PrintingScreen> createState() => _PrintingScreenState();
}

class _PrintingScreenState extends State<PrintingScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  // text drag
  String addedText = '';
  TextStyle addedTextStyle = const TextStyle();
  OverlayEntry? overlayEntry;
  double overlayWidth = 0.0;
  double overlayHeight = 0.0;
  Offset offset = Offset.zero;
  double initDx = 0.0;
  double initDy = DefaultAppBar.defaultAppBarHeight + 24.0;
  bool isMoving = false; // TODO: start에서 border가 생기지 않음
  GlobalKey textKey = GlobalKey();
  bool isCompletionText = false;

  // image sticker
  Set<StickerModel> stickers = {};
  String? selectedId;
  bool isCompletionImage = false;

  @override
  void initState() {
    super.initState();

    initOverlayProperty();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(
        title: '프린팅',
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset('asset/image/product/${widget.id}.png'),
                  if (image != null)
                    Positioned.fill(
                      child: InteractiveViewer(
                        child: Stack(
                          fit: StackFit.expand, // 크기 최대로 늘리기
                          children: [
                            ...stickers.map(
                              // 기본 위치는 중앙
                              (sticker) {
                                setState(() {
                                  isCompletionImage = true;
                                });
                                return Center(
                                  child: Sticker(
                                    key: ObjectKey(sticker.id),
                                    onTransform: () {
                                      onTransform(sticker.id);
                                    },
                                    imgPath: sticker.imagePath,
                                    isSelected: selectedId == sticker.id,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24.0),
                    CustomContainerButton(
                      title: '텍스트 추가',
                      isSelected: isCompletionText,
                      onTap: () {
                        initOverlayProperty();
                        showAddTextModal(context: context);
                        // _clickShow();
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomContainerButton(
                      title: '이미지 추가',
                      isSelected: isCompletionImage,
                      onTap: () async {
                        await getImage();
                        // _removeOverlay();
                      },
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: 좌표에 의한 이미지 저장 후 completionItem 에 추가

                        // text 제거
                        initOverlayProperty();

                        // 완료 페이지로 이동
                        Navigator.of(context).pushNamed(
                          RouteNames.completion,
                          arguments: ScreenArguments('title', '커스텀이 완료되었습니다.'),
                        );
                      },
                      child: const Text('편집 완료'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    // 이미지를 정상적으로 가져왔다면 텍스트 인식 실행
    if (pickedFile != null) {
      setState(() {
        image = XFile(pickedFile.path); // 가져온 이미지를 _image에 저장
        stickers = {
          ...stickers,
          StickerModel(
            id: Uuid().v4(), // 스티커의 고유 ID
            imagePath: image!.path,
          )
        };
      });
    }
  }

  void onTransform(String id) {
    setState(() {
      selectedId = id;
    });
  }

  void popBottomSheet() {
    Navigator.of(context).pop();
    setState(() {});
  }

  void showAddTextModal({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => PrintingAddTextBottomSheet(
        popBottomSheet: popBottomSheet,
        addText: addText,
      ),
    );
  }

  Size? _getSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
    return null;
  }

  Future<void> _clickShow() async {
    if (overlayEntry != null) {
      return;
    }
    overlayEntry = _showOverlay();
    Overlay.of(context).insert(overlayEntry!);

    await Future.delayed(const Duration(seconds: 1));
    if (_getSize(textKey) != null) {
      print('가져옴');
      overlayWidth = _getSize(textKey)!.width;
      overlayHeight = _getSize(textKey)!.height;
    }
  }

  void initOverlayProperty() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
    }
    overlayEntry = null; // 위에 존재하는 overlay 된 Widget
    overlayWidth = 100; // 위에 존재하는 overlay 된 Widget의 Width (지정하겠다는 의미.)
    overlayHeight = 50;
    offset = Offset(initDx, initDy); // 위치, default (0, 0), 폰에 존재하는 위치 좌표 좌측 상단
  }

  OverlayEntry _showOverlay() {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        double dx = initDx;
        double dy = initDy;
        double maxDx = MediaQuery.of(context).size.width;
        double maxDy = MediaQuery.of(context).size.width +
            24.0 +
            DefaultAppBar.defaultAppBarHeight;

        if ((offset.dx > 0) && ((offset.dx + overlayWidth) < maxDx)) {
          // 내가 생각하는 범위 안에 있을때는 이동한 위치는 그대로 적용해라.
          dx = offset.dx;
        } else if ((offset.dx + overlayWidth) >= maxDx) {
          // width 를 넘어가게 되면 widget 좌측 상단을 overlayWidth 만큼 빼서 거기로 이동해라.
          dx = maxDx - overlayWidth;
        } else {
          // 그외 모든 경우는 x 축 위치를 0으로 지정해라.
          dx = 0;
        }

        if ((offset.dy > initDy) && ((offset.dy + overlayHeight) < maxDy)) {
          dy = offset.dy;
        } else if ((offset.dy + overlayHeight) >= maxDy) {
          dy = maxDy - overlayHeight;
        } else {
          dy = initDy;
        }

        // 위에 올라오는 overlay widget 전체
        return Positioned(
          top: dy,
          left: dx,
          child: Draggable(
            // 드래그 되는 동안 터치 포인트 위치에 그려질 위젯
            feedback: _contentBody(isMoving: true),
            // 드래그 할 대상이 되는 위젯
            child: _contentBody(isMoving: false),
            // 드래그 중 원래 자리에 둘 위젯
            childWhenDragging: Container(),
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              setState(() {
                this.offset = offset;
              });
            },
            //data 는 드래그가 완료되어 DragTarget 에 드롭될 때 전달할 데이터
          ),
        );
      },
    );
    return overlayEntry;
  }

  Widget _contentBody({required bool isMoving}) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: isMoving
              ? Border.all(
                  width: 1.0,
                  color: DEFAULT_TEXT_COLOR,
                )
              : null,
        ),
        child: Text(
          key: textKey,
          addedText,
          style: addedTextStyle,
        ),
      ),
    );
  }

  void addText({
    required String title,
    required TextStyle textStyle,
  }) async {
    addedText = title;
    addedTextStyle = textStyle;
    isCompletionText = true;
    setState(() {});
    await _clickShow();
  }
}
