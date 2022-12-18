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
        return 'Thành công';
      case Status.cancel:
        return 'cancel_status';
      case Status.invalidParam:
        return 'Param không đúng';
      case Status.resourceNotFound:
        return 'Không tìm thấy dữ liệu';
      case Status.timeOut:
        return 'Thời gian gửi yêu cầu quá lâu, vui lòng thử lại sau';
      case Status.unAuthorized:
        return 'Sai mật khẩu hoặc tên đăng nhập, vui lòng thử lại sau';
      case Status.serverError:
        return 'Server đang quá tải, vui lòng thử lại sau';
      default:
        return 'Lỗi không xác định';
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
      message = Status.unKnown.message;
    }
  }

  Status _mapCodeToState(int statusCode) {
    if (statusCode > 500) {
      return Status.serverError;
    } else {
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
