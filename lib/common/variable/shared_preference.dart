import 'dart:convert';

import 'package:custom_clothes/common/model/product_model.dart';
import 'package:custom_clothes/common/variable/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

Future<void> getPreferenceData() async {
  String? retrieveJsonString = sharedPreferences?.getString('items');
  if (retrieveJsonString == null) {
    return;
  }

  var retrieveData = jsonDecode(retrieveJsonString) as List<dynamic>;

  List<ProductModel> getUserProductItems = [];
  for (var i in retrieveData) {
    getUserProductItems.add(
      ProductModel.fromJson(json: i),
    );
  }

  userProductItems = getUserProductItems;
}

Future<void> setPreferenceData() async {
  await sharedPreferences?.clear();

  List<Map<String, dynamic>> data =
      userProductItems.map((e) => e.toJson()).toList();
  String postJsonString = jsonEncode(data);
  await sharedPreferences?.setString('items', postJsonString);
}
