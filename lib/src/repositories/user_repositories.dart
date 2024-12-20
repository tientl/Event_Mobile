import 'dart:convert';

import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/network/api_provider.dart';
import 'package:event_app/src/common/network/api_response.dart';
import 'package:event_app/src/data/model/service.dart';
import 'package:event_app/src/data/model/user.dart';

class UserRepositories {
  final ApiProvider _apiProvider;

  UserRepositories(this._apiProvider);

  Future<ResponseData<User>> login(String userName, String passWord) async {
    try {
      final data = {'user_name': userName, 'password': passWord};
      final res = await _apiProvider.post(AppConstant.login, data: data);
      if (res['data'] != null) {
        final user = User.fromJson(res['data']);
        return ResponseData.success(user, response: res);
      } else {
        return ResponseData.success(null, response: res);
      }
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

  Future<ResponseData<bool>> ratingEvent(
      {int? eventId,
      int? subScheduleId,
      required int userId,
      required int rating,
      required String eluvate,
      required bool isEvent}) async {
    try {
      final data = {
        'event_id': eventId,
        'sub_schedule_id': subScheduleId,
        'partner_id': userId,
        'rating': rating,
        'evaluate': eluvate,
        'is_event': isEvent,
        'is_schedule': !isEvent
      };
      final res = await _apiProvider.post(AppConstant.rating, data: data);
      return ResponseData.success(true, response: res);
    } catch (e) {
      return ResponseData.failed(e);
    }
  }

  Future<ResponseData<bool>> changePass(
      {required int userId, required String newPass}) async {
    try {
      final data = {'user_id': userId, 'new_pass': newPass};

      final res = await _apiProvider.post(AppConstant.changePass, data: data);
      return ResponseData.success(true, response: res);
    } catch (e) {
      return ResponseData.failed(e);
    }
  }

  Future<ResponseData<User?>> scannerQR(
      {required int userId, required int eventId}) async {
    try {
      final data = {'user_id': userId, 'event_id': eventId};

      final scannerRes =
          await _apiProvider.post(AppConstant.scannerQR, data: data);
      if (scannerRes != null) {
        final user = User.fromJson(scannerRes);
        return ResponseData.success(user, response: scannerRes);
      }
      return ResponseData.success(null, response: scannerRes);
    } catch (e) {
      return ResponseData.failed(e);
    }
  }

  Future<ResponseData> submitService(
      {required int userId,
      required int eventdId,
      required List<Map<String, dynamic>> services}) async {
    try {
      final data = {
        'partner_id': userId,
        'event_id': eventdId,
        'services': services
      };
      final res =
          await _apiProvider.post(AppConstant.submitService, data: data);
      return ResponseData.success(true, response: res);
    } catch (e) {
      return ResponseData.failed(e);
    }
  }
}
