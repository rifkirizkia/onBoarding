import 'package:get/get.dart';

import '../models/foods_model.dart';
import '../repository/foods_api.dart';

class FoodsController extends GetxController {
  final FoodsApi foodApi = FoodsApi();
 //FoodsModel? foods;
 var foods = FoodsModel().obs;
  Future<void> getFood() async {
    final res = await foodApi.getFoods();
    print("hasil res => $res");
    foods.update((val) { 
      foods = FoodsModel.fromJson(res!) as Rx<FoodsModel>;
    });
  }
}
