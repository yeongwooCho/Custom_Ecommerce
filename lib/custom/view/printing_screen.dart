import 'package:custom_clothes/common/view/completion_screen.dart';
import 'package:custom_clothes/common/const/colors.dart';
import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:custom_clothes/common/route/routes.dart';
import 'package:custom_clothes/custom/component/custom_container_button.dart';
import 'package:custom_clothes/custom/view/bottom_sheet/printing_add_text_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _image;

  // text drag
  OverlayEntry? overlayEntry;
  double overlayWidth = 0.0;
  double overlayHeight = 0.0;
  Offset offset = Offset.zero;
  double initDx = 0.0;
  double initDy = DefaultAppBar.defaultAppBarHeight + 24.0;
  bool isMoving = false; // TODO: start에서 border가 생기지 않음

  GlobalKey textKey = GlobalKey();

  Size? _getSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
    return null;
  }

  _clickShow() async {
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

  _removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      initOverlayProperty();
    }
  }

  void initOverlayProperty() {
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

        return Positioned(
          top: dy,
          left: dx,
          child: Draggable(
            feedback: _contentBody(),
            child: _contentBody(),
            childWhenDragging: Container(),
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              setState(() {
                this.offset = offset;
              });
            },
          ),
        );
      },
    );
    return overlayEntry;
  }

  Widget _contentBody() {
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
          'HIHI',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('asset/image/product/${widget.id}.png'),
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
                      isSelected: false,
                      onTap: () {
                        // showAddTextModal(context: context);
                        _clickShow();
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomContainerButton(
                      title: '이미지 추가',
                      isSelected: false,
                      onTap: () {
                        // getImage();
                        _removeOverlay();
                      },
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {
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

  void getImage() async {
    // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    // 이미지를 정상적으로 가져왔다면 텍스트 인식 실행
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); // 가져온 이미지를 _image에 저장
      });
    }
  }

  void popBottomSheet() {
    Navigator.of(context).pop();
    setState(() {});
  }

  void showAddTextModal({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      barrierColor: BARRIER_COLOR,
      backgroundColor: EMPTY_COLOR,
      builder: (_) => PrintingAddTextBottomSheet(
        popBottomSheet: popBottomSheet,
      ),
    );
  }
}
