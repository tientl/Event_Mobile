import 'package:dio/dio.dart';
import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/network/api_exceptions.dart';
import 'package:event_app/src/common/network/api_intercepter.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    final dioOptions = BaseOptions();
    dioOptions.connectTimeout = AppConstant.timeOut;
    dioOptions.sendTimeout = AppConstant.timeOut;
    dioOptions.receiveTimeout = AppConstant.timeOut;
    dioOptions.responseType = ResponseType.json;
    dioOptions.baseUrl = AppConstant.baseUrl;

    _dio = Dio(dioOptions);

    _dio.interceptors.add(ApiIntercepter());

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          responseBody: true,
          compact: false));
    }
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? params,
      CancelToken? cancelToken}) async {
    final response =
        await _dio.get(path, queryParameters: params, cancelToken: cancelToken);
    final responseData =
        await _throwIfNotSucess(response: response);
    return responseData;
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {

    final response = await _dio.post(path,
        queryParameters: params, data: data, cancelToken: cancelToken);
    final responseData =
        await _throwIfNotSucess(response: response);
    return responseData;
  }


  _throwIfNotSucess(
      {required Response response}) async {
    final responseData = response.data;

    switch (response.statusCode) {
      case 200:
        return responseData;
      case 400:
        throw InvalidPrameter(response.statusCode);
      case 401:
        throw UnauthoriseException(response.statusCode);
      case 403:
        throw ForbiddenExeption(response.statusCode);
      case 404:
        throw ResourceNotFound(response.statusCode);
      default:
        throw FetchDataException(response.statusCode);
    }
  }
}
