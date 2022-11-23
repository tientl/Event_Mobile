import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;
  final formKey = const GlobalObjectKey<FormState>(1);
  final UserRepositories userRepositories;

  LoginController(this.userRepositories);

  onclickRememberme(bool value) {
    rememberMe.value = value;
  }

  //Validation
  String? onValidationUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_user_name'.tr;
    }
    return null;
  }

  String? onValidationPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_password'.tr;
    }
    return null;
  }

  Future<void> onLogin() async {
    if (formKey.currentState == null) {
      AlertDialogWidget.show();
    } else if (formKey.currentState!.validate()) {
      final loginRes = await userRepositories.login(
          emailController.text, passwordController.text);
      if (loginRes.isSuccess() && loginRes.data != null) {
        AppManager().onLogin(loginRes.data!);
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        AlertDialogWidget.show(content: loginRes.message);
      }
    }
  }
}
