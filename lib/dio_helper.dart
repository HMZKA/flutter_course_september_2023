import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/v2/"));
  }

  static Future<Response?> getApi() async {
    return await dio?.get("everything", queryParameters: {
      "q": "tesla",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    });
  }
}
