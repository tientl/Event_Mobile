import 'dart:convert';

import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:get/get.dart';

class BarcodeController extends GetxController {
  final currentUser = AppManager().currentUser;
  final idCurrentEvent = (-1).obs;
  final dataQr = ''.obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is Event) {
      idCurrentEvent.value = argument.id;
      dataQr.value = jsonEncode({
        'id_user': currentUser?.id.toString(),
        'id_event': idCurrentEvent.value.toString()
      });
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (idCurrentEvent.value == -1) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }
}
