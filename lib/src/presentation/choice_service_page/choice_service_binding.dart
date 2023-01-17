import 'package:event_app/src/presentation/choice_service_page/choice_service_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class ChoiceServiceBinding extends Bindings {
  @override
  void dependencies() {
    final userRepository = Get.find<UserRepositories>();
    Get.lazyPut(() => ChoiceServiceControlller(userRepository));
  }
}
