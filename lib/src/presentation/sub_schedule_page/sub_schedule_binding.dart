import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class SubScheduleBinding extends Bindings{
  @override
  void dependencies() {
    final userRepositories = Get.find<UserRepositories>();
    Get.lazyPut<SubScheduleController>(() => SubScheduleController(userRepositories));
  }
}