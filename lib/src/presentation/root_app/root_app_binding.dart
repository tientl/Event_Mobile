import 'package:event_app/src/presentation/barcode/barcode_controller.dart';
import 'package:event_app/src/presentation/home_event/home_event_controller.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_controller.dart';
import 'package:event_app/src/presentation/root_app/root_app_controller.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_controller.dart';
import 'package:get/get.dart';

class RootAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootAppController>(() => RootAppController());
    Get.put<HomeEventController>(HomeEventController());
    Get.put<ScheduleController>(ScheduleController());
    Get.put<BarcodeController>(BarcodeController());
    Get.put<ProfileEventController>(ProfileEventController());
  }
}
