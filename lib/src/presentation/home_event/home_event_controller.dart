import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:get/get.dart';

class HomeEventController extends GetxController {
  final user = AppManager().currentUser;
  final currentEvent = Rxn<Event>(null);

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument == null) {
      AlertDialogWidget.show();
    } else {
      currentEvent.value = argument;
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (currentEvent.value == null) {
      AlertDialogWidget.show();
    }
    super.onReady();
  }

  onNavigateToListSponsor() {
    
    Get.toNamed(AppRoutes.listSponsor, arguments: currentEvent.value?.sponsor);
  }

  onNavigateToListSpeaker() {
    Get.toNamed(AppRoutes.listUser);
  }
}
