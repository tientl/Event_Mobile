import 'package:event_app/src/common/network/api_provider.dart';
import 'package:event_app/src/presentation/login_page/login_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final apiProvider = Get.find<ApiProvider>();
    final UserRepositories userRepositories = UserRepositories(apiProvider);

    Get.lazyPut<LoginController>(() => LoginController(userRepositories));
  }
}
