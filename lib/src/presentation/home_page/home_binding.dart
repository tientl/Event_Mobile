import 'package:event_app/src/presentation/home_page/home_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final userRepositories = Get.find<UserRepositories>();
    Get.lazyPut<HomeController>(() => HomeController(userRepositories));
  }
}
