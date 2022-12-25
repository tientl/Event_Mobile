import 'package:get/get.dart';

abstract class AppConstant {
  static const timeOut = 20000;
  static const baseUrl = 'https://event-tienlt-final.ims-online.com.vn/';
  static const login = '/users/login';
  static const confirmEvent = '/users/confirm';
  static const rating = '/users/rating';
  static const changePass ='users/change_password';

  //size
  static final  height = Get.height;
  static final width = Get.width;
}
