import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChoiceEventController extends GetxController {
  final events = <Event>[].obs;
  final currentEvent = Rxn<Event>(null);

  @override
  void onInit() {
    final arguement = Get.arguments;
    if (arguement is List<Event>) {
      events.value = arguement;
      currentEvent.value = events[0];
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (events.isEmpty) {
      AlertDialogWidget.show(
          onPress: () => Get.close(2), barrierDismissible: true);
    }
    super.onReady();
  }

  onServiceChange(Event? event) {
    if (event == null) return;
    currentEvent.value = event;
  }

  onNavigateToChooseDependedAppointment() {
    if (currentEvent.value != null) {
      AppManager().updateCurrentEvent(currentEvent.value!);
      Get.toNamed(AppRoutes.adminHome);
      debugPrint('test');
    }
  }
}
