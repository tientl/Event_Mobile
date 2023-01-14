import 'package:event_app/src/presentation/profile_event/profile_event_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    final userRepository = Get.find<UserRepositories>();
    Get.lazyPut(() => ProfileEventController(userRepository));
  }
}
