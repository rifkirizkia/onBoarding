import 'dart:convert';

import 'package:get/get.dart';

import '../models/foods_model.dart';
import '../repository/foods_api.dart';

class FoodsController extends GetxController {
  final FoodsApi foodApi = FoodsApi();
  //var foods = FoodsModel().obs;
  getFoods({required Function(List<FoodsModel>) onDone}) async {
    final result = await foodApi.getRequest().then((data) {
      return jsonDecode(data);
    }).then((value) {
      List<FoodsModel> arrayFoods = [];
      for (var element in value) {
        arrayFoods.add(FoodsModel.fromJson(element));
      }
      return arrayFoods;
    });
    onDone.call(result);
  }
}
