import 'package:dio/dio.dart';
import 'package:flutter_application_course/utils/cache.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
        BaseOptions(baseUrl: "https://student.valuxapps.com/api/", headers: {
      'Content-Type': 'application/json',
      "lang": "en",
      "Authorization": CacheHelper.get(key: "token") ?? ""
    }));
  }

  static Future<Response?> get(
      {required String path, Map<String, dynamic>? query}) async {
    return await dio?.get(path, queryParameters: query);
  }

  static Future<Response?> post(
      {required String path,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    return await dio?.post(path, queryParameters: query, data: data);
  }
}
