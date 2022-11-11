import 'package:dio/dio.dart';
import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/app/app_manager.dart';

class ApiIntercepter extends InterceptorsWrapper {

  ApiIntercepter();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    setHeaderRequest(options);
    return handler.next(options);
  }

  void setHeaderRequest(RequestOptions options) {
    final appManager = AppManager();
    if (appManager.isSignIn()) {
      options.headers = appManager.authHeader;
    }
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
