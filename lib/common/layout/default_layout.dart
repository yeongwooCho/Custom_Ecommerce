import 'dart:convert';

import 'package:custom_clothes/common/layout/default_appbar.dart';
import 'package:custom_clothes/common/model/product_model.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultLayout extends StatefulWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget child;

  const DefaultLayout({
    this.backgroundColor,
    this.appbar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();

    initSharedPreference();
  }

  void initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();

    await getPreferenceData();
  }

  Future<void> getPreferenceData() async {
    // input
    String? retrieveJsonString = prefs!.getString('items');
    if (retrieveJsonString == null) { return; }

    var retrieveData = jsonDecode(retrieveJsonString) as List<dynamic>;
    for (var i in retrieveData) {
      userProductItems.add(ProductModel.fromJson(json: i));
    }

    setState(() {});
  }

  Future<void> setPreferenceData() async {
    // output
    List<Map<String, dynamic>> data =
    userProductItems.map((e) => e.toJson()).toList();
    String postJsonString = jsonEncode(data);
    await prefs!.setString('items', postJsonString);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      // 기본배경이 완전 흰색은 아니다.
      body: widget.child,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
