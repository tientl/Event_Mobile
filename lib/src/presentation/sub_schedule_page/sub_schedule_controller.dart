import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/presentation.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';
import 'package:get/get.dart';

class SubScheduleController extends GetxController {
  final subSchedule = Rxn<SubSchedule>(null);
  final date = ''.obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument['subschedule'] is SubSchedule && argument['date'] is String) {
      subSchedule.value = argument['subschedule'];
      date.value = argument['date'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (subSchedule.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }

  getListSpeakerName() {
    late String result = '';
    subSchedule.value?.presentation?.speaker
        ?.map((e) => result += e.name != null ? '${e.name} ' : '' );
  }

  onNavigateToPresentationDetailPage(Presentation presentation){
    final argument = {
      'presentation':presentation,
      'total_hour': subSchedule.value?.totalHour ?? 0,
      'location': subSchedule.value?.location ?? 'Chưa xác định'
    };
    Get.toNamed(AppRoutes.presentationDetail, arguments:argument );
  }
}
