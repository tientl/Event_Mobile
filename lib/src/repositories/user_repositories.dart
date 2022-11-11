import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/network/api_provider.dart';
import 'package:event_app/src/common/network/api_response.dart';

class UserRepositories {
  final ApiProvider _apiProvider;

  UserRepositories(this._apiProvider);
  
  Future<ResponseData<bool>> login(
      String userName, String passWord) async {
    try {
      final data = {'user_name': userName, 'password': passWord};
      final res = await _apiProvider.post(AppConstant.login, data: data);
      return ResponseData.success(true, response: res);
    } catch (e) {
      return ResponseData.failed(e.toString());
    }
  }
}
