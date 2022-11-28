import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController{
    final currentDate = DateTime.now().obs;
  final firstDate = DateTime.now();
  final selectedDay = DateTime.now().obs;
  final lstDate = DateTime.now().add(const Duration(days: 30));


    onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    currentDate.value = focusedDate;
    selectedDay.value = selectedDate;

  }

  onNavigateDetailSchedularPage(){
    Get.toNamed(AppRoutes.scheduleItem);
  
  }

  
}