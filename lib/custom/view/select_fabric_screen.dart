import 'package:custom_clothes/common/model/screen_arguments.dart';
import 'package:flutter/material.dart';

class SelectFabricScreen extends StatelessWidget {
  final String id;

  const SelectFabricScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(id),
    );
  }
}
