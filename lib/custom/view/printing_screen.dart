import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/layout/default_layout.dart';
import 'package:custom_clothes/custom/component/custom_container_button.dart';
import 'package:flutter/material.dart';

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
                      onTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    CustomContainerButton(
                      title: '이미지 추가',
                      isSelected: false,
                      onTap: () {},
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {},
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
}
