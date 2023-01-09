import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';

class AdminFindController extends GetxController {
  final nameController = TextEditingController();
  final idTextController = TextEditingController();
  final formKey = const GlobalObjectKey<FormState>(8);
  final registations = AppManager().currentEvent!.registrations;
  final registationsResult = <Registration>[].obs;

  onFind() {
    registationsResult.value = registations!
        .where((element) =>
            (TiengViet.parse(element.name!).toLowerCase().contains(
                TiengViet.parse(nameController.text.trim()).toLowerCase())) &&
            (TiengViet.parse(element.id.toString()).toLowerCase().contains(
                TiengViet.parse(idTextController.text.trim()).toLowerCase())))
        .toList();
  }
}
