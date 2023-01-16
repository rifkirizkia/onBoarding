import 'package:get/get.dart';

import '../models/foods_model.dart';
import '../repository/foods_api.dart';

class FoodsController extends GetxController {
  List<FoodsModel> foodModel = [];
  final _foodsApi = FoodsApi();
  void getFoodList() {
    _foodsApi.getFoods(onDone: (data) {
      foodModel = data;
      update();
    });
  }
}