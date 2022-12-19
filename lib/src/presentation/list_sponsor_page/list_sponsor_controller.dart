import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:get/get.dart';

class ListSponsorController extends GetxController {
  final currentListSponsor = [].obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument != null) {
      currentListSponsor.value = argument;
    }
    super.onInit();
  }

  @override
  void onReady() {
    final argument = Get.arguments;
    if (argument == null) {
      AlertDialogWidget.show();
    }
    super.onReady();
  }
}
