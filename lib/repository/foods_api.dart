import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:onboarding/models/foods_model.dart';

class FoodsApi {
  // Future<Dio> apiNormal() async {
  //   BaseOptions dioOption = BaseOptions(
  //     baseUrl: "https://playground-rest-api-vk3y7f3hta-et.a.run.app/",
  //     responseType: ResponseType.plain,
  //   );
  //   Dio dio = Dio(dioOption);
  //   dio.interceptors.add(LogInterceptor(
  //       responseBody: true, requestBody: true, requestHeader: true));
  //   return dio;
  // }

  getRequest() async {
    try {
      var dio = Dio();
      final res = await dio
          .get<String>(
              "https://playground-rest-api-vk3y7f3hta-et.a.run.app/foods")
          .then((value) {
        return value.data!;
      });
      print("hasil res => ${res}");
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
