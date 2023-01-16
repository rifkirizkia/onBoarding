import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:onboarding/models/foods_model.dart';

class FoodsApi {
  getRequest() async {
    try {
      var dio = Dio();
      final res = await dio
          .get<String>(
              "https://playground-rest-api-vk3y7f3hta-et.a.run.app/foods")
          .then((value) {
        return value.data!;
      });
      return res;
    } on DioError catch (e) {
      print("hasil eror=> $e");
    } catch (e) {
      print("error => $e");
    }
  }

  getFoods({required Function(List<FoodsModel>) onDone}) async {
    final List<FoodsModel> result = await getRequest().then((data) {
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
