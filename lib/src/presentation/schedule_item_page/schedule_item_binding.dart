import 'package:event_app/src/presentation/schedule_item_page/schedule_item_controller.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_controller.dart';
import 'package:get/get.dart';

class ScheduleItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ScheduleItemController>(() => ScheduleItemController());
  }
}