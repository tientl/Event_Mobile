import 'package:event_app/src/app/app_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final currentUser = AppManager().currentUser;
  final formKeyUserName = const GlobalObjectKey<FormState>(11);
  final formKeyFullNam = const GlobalObjectKey<FormState>(12);
  final formKeyEmail = const GlobalObjectKey<FormState>(13);
  final userNamaeController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  onValidRating(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập thông tin";
    }
  }
}
