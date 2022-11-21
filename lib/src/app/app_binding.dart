import 'package:event_app/src/common/network/api_provider.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  AppBinding();
  @override
  void dependencies() {
    final apiProvider = ApiProvider();
    final userRepositories = UserRepositories(apiProvider);
    Get.put<ApiProvider>(apiProvider);
    Get.put<UserRepositories>(userRepositories);
  }
}
