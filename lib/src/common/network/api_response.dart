import 'dart:convert';
import 'package:dio/dio.dart';

enum Status {
  success,
  cancel,
  timeOut,
  unKnown,
  unAuthorized,
  resourceNotFound,
  invalidParam,
  serverError,
}

extension StatusExt on Status {
  String get message {
    switch (this) {
      case Status.success:
        return 'success_status';
      case Status.cancel:
        return 'cancel_status';
      case Status.invalidParam:
        return 'invalid_param_status';
      case Status.resourceNotFound:
        return 'resource_not_found_status';
      case Status.timeOut:
        return 'time_out_status';
      case Status.unAuthorized:
        return 'unauthorized_status';
      case Status.serverError:
        return 'server_error';
      default:
        return 'unknown_status';
    }
  }
}

class ResponseData<T> {
  T? data;
  Status? status;
  String? message;

  bool isSuccess() {
    return status == Status.success;
  }

  ResponseData.success(this.data, {dynamic response}) {
    status = Status.success;

    if (response is Map<String, dynamic>) {
      final statusCode = response['code'];

      status = _mapCodeToState(statusCode);
      message = response['message'];
    }

    message = message?.isEmpty == true ? status?.message : message;
  }

  ResponseData.failed(dynamic error) {
    if (error is DioErrorType || error is DioError) {
      status = _mapErrorToState(error);
      try {
        final json = jsonDecode(error?.response.toString() ?? '');
        if (json == null) {
          message = status?.message;
        } else {
          message = json['message'].toString();
        }
      } catch (e) {
        message = status?.message;
      }
    } else {
      status = Status.unKnown;
      message = error.toString();
    }
  }

  Status _mapCodeToState(int statusCode) {
    switch (statusCode) {
      case 200:
        return Status.success;
      case 400:
        return Status.invalidParam;
      case 401:
        return Status.unAuthorized;
      case 404:
        return Status.resourceNotFound;
      case 500:
        return Status.serverError;
      default:
        return Status.unKnown;
    }
  }

  Status _mapErrorToState(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return Status.cancel;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return Status.timeOut;
        default:
          return Status.unKnown;
      }
    }
    return Status.unKnown;
  }

  @override
  String toString() {
    return "Reponse data: $data \n Status: $status \n Message: $message";
  }
}
