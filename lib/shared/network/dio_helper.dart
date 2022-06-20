import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://healthmental-you.herokuapp.com/',
      receiveDataWhenStatusError: true,

      followRedirects: false,
      // will not throw errors
      //validateStatus: (status) => true,
      /* connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, */
      /* sendTimeout: 20 * 1000,
      responseType: ResponseType.plain, */
      /*  followRedirects: false,
        validateStatus: (status) {
          return true;
        } */
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? Lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      required /* Map<String, dynamic> */ data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return dio.put(url, queryParameters: query, data: data);
  }
}
