import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/presentation.dart';
import 'package:get/get.dart';

class PresentstionDetailController extends GetxController {
  final presentation = Rxn<Presentation>(null);
  final location = ''.obs;
  final totalHour = 0.0.obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument['presentation'] is Presentation &&
        argument['location'] is String &&
        argument['total_hour' ] is double) {
      presentation.value = argument['presentation'];
      location.value = argument['location'];
      totalHour.value = argument['total_hour'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (presentation.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }
}
