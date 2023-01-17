import 'package:get/get.dart';

import '../models/foods_model.dart';
import '../repository/foods_api.dart';

class FoodsController extends GetxController {
  List<FoodsModel> foodModel = [];
  final _foodsApi = FoodsApi();
  bool? isLoading;

  @override
  void onInit() {
    getFoodList();
    super.onInit();
  }

  void getFoodList() {
    isLoading = true;
    update();
    _foodsApi.getFoods(onDone: (data) {
      foodModel = data;
      isLoading = false;
      update();
    });
  }
}
