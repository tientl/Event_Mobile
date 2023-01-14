import 'package:event_app/src/presentation/login_page/login_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final userRepositories = Get.find<UserRepositories>();

    Get.put<LoginController>(LoginController(userRepositories));
  }
}
