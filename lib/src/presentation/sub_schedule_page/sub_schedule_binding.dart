import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_controller.dart';
import 'package:get/get.dart';

class SubScheduleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SubScheduleController>(() => SubScheduleController());
  }
}