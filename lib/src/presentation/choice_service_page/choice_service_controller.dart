import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:event_app/src/data/model/service.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChoiceServiceControlller extends GetxController {
  ChoiceServiceControlller(this.userRepositories);

  UserRepositories userRepositories;
  final services = <Service>[].obs;
  final eventId = RxnInt(null);
  final currentUser = AppManager().currentUser;

  final textController = <TextEditingController>[].obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument['services'] is List<Service> && argument['id_event'] is int) {
      eventId.value = argument['id_event'];
      services.value = argument['services'];
      textController.value = List.generate(
          services.length, (_) => TextEditingController(text: ''));
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (services.isEmpty || currentUser == null || eventId.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }

  @override
  void dispose() {
    for (var element in textController) {
      element.dispose();
    }
    super.dispose();
  }

  onChoiceService(int index, bool? val) {
    services[index].isChoice = val ?? services[index].isChoice;
    if (val == false) textController[index].text = '';
    services.refresh();
  }

  onSubmit() async {
    for (int i = 0; i < services.length; i++) {
      services[i].requiredAnswer = textController[i].text;
    }
    List<Map<String, dynamic>> submitService = [];
    for (int i = 0; i < services.length; ++i) {
      if (services[i].isChoice) {
        submitService.add(services[i].toJson());
      }
    }
    final submitServicesRes = await userRepositories.submitService(
        userId: currentUser!.id,
        eventdId: eventId.value!,
        services: submitService);
    if (submitServicesRes.data = true) {
      AlertDialogWidget.show(
          typeOfDialog: TypeOfDialog.success,
          title: 'Gửi yêu cầu thành công',
          content:
              'Yêu cầu về dịch vụ của bạn đã được gửi đến chủ sự kiện',
          onPress: () => Get.close(2));
    } else {
      AlertDialogWidget.show(content: submitServicesRes.message);
    }
  }
}
