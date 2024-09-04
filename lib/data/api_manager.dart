import 'package:dio/dio.dart';
import 'package:flutter_e_commerece_c11_sun/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters, ResponseType? responseType}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
            validateStatus: ((status) => true), responseType: responseType));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: ((status) => true)));
  }
}
