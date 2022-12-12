import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';
import 'package:get/get.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class ScheduleController extends GetxController {
  final firstDate = DateTime.now();
  final selectedDay = DateTime.now().obs;
  final lstDate = DateTime.now().add(const Duration(days: 30));
  final listDate = <DateTime>[].obs;
  final listSubScheduler = <SubSchedule>[].obs;
  final currentUser = AppManager().currentUser;
  final currentDate = Rxn<DateTime>(null);
  final currentListSubSchedule = <SubSchedule>[].obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is Event) {
      listSubScheduler.value = argument.listSubScheduler ?? [];
      listDate.value = argument.listDate;
      currentDate.value = listDate[0];
      onGetListSubscheduleByDate();
    }
    super.onInit();
  }

  onChangeDate(DateTime date) {
    currentDate.value = date;
    onGetListSubscheduleByDate();
  }

  onGetListSubscheduleByDate() {
     currentListSubSchedule.value = listSubScheduler
          .where((p0) => p0.timeScheduler?.isSameDate(currentDate.value) ?? false)
          .toList();
  }

  onNavigateToSubSchedulePage(SubSchedule subSchedule){
    final argument = {
      'subschedule': subSchedule,
      'date': currentDate.value?.ddmmyyyy
    };
    Get.toNamed(AppRoutes.subSchedule,arguments: argument);
  }


}
