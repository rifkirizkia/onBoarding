import 'package:get/get.dart';

import '../models/foods_model.dart';
import '../repository/foods_api.dart';

class FoodsController extends GetxController {
  List<FoodsModel> foodModel = [];
  final _foodsApi = FoodsApi();

  @override
  void onInit() {
    getFoodList();
    super.onInit();
  }

  void getFoodList() {
    _foodsApi.getFoods(onDone: (data) {
      foodModel = data;
      update();
    });
  }
}
