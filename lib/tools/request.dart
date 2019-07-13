import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/entity_factory.dart';

class Request {
  static final Request _instance = Request._internal();
  Dio dio;

  factory Request() => _instance;

  Request._internal() {
    if (null == dio) {
      // 通过传递一个 `BaseOptions` 来创建dio实例
      BaseOptions options = new BaseOptions(
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      dio = new Dio(options);
    }
  }

  Future <T> get<T>(String path, [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await Request().dio.get(path, queryParameters: params);
    } else {
      response = await Request().dio.get(path);
    }
    return EntityFactory.generateOBJ<T>(response.data);
  }

//  Future<Map<String, dynamic>> get(String path, [Map<String, dynamic> params]) async {
//    Response<Map<String, dynamic>> response;
//    if (null != params) {
//      response = await dio.get(path, queryParameters: params);
//    } else {
//      response = await dio.get(path);
//    }
//    return response.data;
//  }
}
