import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api.github.com/",
      receiveDataWhenStatusError: true,
    ));
  }
//GET DATA FROM API
  static Future <Response>getData({required String url }) async{
    return await dio!.get(url);
  }
}
