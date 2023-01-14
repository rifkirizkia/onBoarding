import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:onboarding/models/foods_model.dart';

class FoodsApi {
  Future<Dio> apiNormal() async {
    BaseOptions dioOption = BaseOptions(
      baseUrl: "https://playground-rest-api-vk3y7f3hta-et.a.run.app/",
      responseType: ResponseType.json,
    );
    Dio dio = Dio(dioOption);
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, requestHeader: true));
    return dio;
  }

  _getRequest({required String endpoint, param}) async {
    try {
      final dio = await apiNormal();
      final res = await dio.get(endpoint, queryParameters: param).then((value) {
        print("hasil Value => $value");
        return value.data;
      }).then((value) {
        return jsonDecode(value);
      });
      print("hasil res => $res");
      return res;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  getFoods() async {
    List<FoodsModel> result =
        await _getRequest(endpoint: "foods").then((value) {
      List<FoodsModel> arrayFoods = [];
      for (var element in value) {
        arrayFoods.add(FoodsModel.fromJson(element));
      }
      return arrayFoods;
    });
    print("Hasil result=> $result");
    return result;
  }
}
