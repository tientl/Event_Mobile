import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/network/api_provider.dart';
import 'package:event_app/src/common/network/api_response.dart';
import 'package:event_app/src/data/model/user.dart';

class UserRepositories {
  final ApiProvider _apiProvider;

  UserRepositories(this._apiProvider);

  Future<ResponseData<User>> login(String userName, String passWord) async {
    try {
      final data = {'user_name': userName, 'password': passWord};
      final res = await _apiProvider.post(AppConstant.login, data: data);
      final user = User.fromJson(res['data']);
      return ResponseData.success(user, response: res);
    } catch (e) {
      return ResponseData.failed(e.toString());
    }
  }

  Future<ResponseData<bool>> confirmEvent(int eventId, int userId) async {
    try {
      final data = {'event_id': eventId, 'user_id': userId};
      final res = await _apiProvider.post(AppConstant.confirmEvent, data: data);
      return ResponseData.success(res['is_confirmed'], response: res);
    } catch (e) {
      return ResponseData.failed(e.toString());
    }
  }
  Future<ResponseData<bool>> ratingEvent({int? eventId, int? subScheduleId,required int userId,required int rating,required String eluvate,required bool isEvent}) async{
    try{
      final data = {
        'event_id': eventId,
        'sub_schedule_id': subScheduleId,
        'partner_id': userId,
        'rating': rating,
        'evaluate': eluvate,
        'is_event': isEvent,
        'is_schedule':!isEvent
      };
      final res = await _apiProvider.post(AppConstant.rating, data: data);
      return ResponseData.success(true, response: res);
    }catch(e){
      return ResponseData.failed(e);
    }
  }
}
