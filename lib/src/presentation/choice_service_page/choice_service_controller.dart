import 'package:event_app/src/data/model/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChoiceServiceControlller extends GetxController {
  final services = [
    Service(id: 1, name: 'Đón tận nơi'),
    Service(id: 1, name: 'Ăn trưa'),
    Service(id: 1, name: 'Du lịch'),
  ].obs;

  final textController = List.filled(3, TextEditingController());

  onChoiceService(int index, bool? val) {
    services[index].isChoice = val ?? services[index].isChoice;
    if (val == false) textController[index].text = '';
    services.refresh();
  }

  onSubmit() {}
}
