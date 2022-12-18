import 'package:event_app/src/presentation/barcode/barcode_controller.dart';
import 'package:event_app/src/presentation/home_event/home_event_controller.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_controller.dart';
import 'package:event_app/src/presentation/root_app/root_app_controller.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class RootAppBinding extends Bindings {
  @override
  void dependencies() {
    final userRepository = Get.find<UserRepositories>();
    Get.lazyPut<RootAppController>(() => RootAppController(userRepository));
    Get.put<HomeEventController>(HomeEventController(userRepository));
    Get.put<ScheduleController>(ScheduleController());
     Get.put<BarcodeController>(BarcodeController());
     Get.put<ProfileEventController>(ProfileEventController());
  }
}
