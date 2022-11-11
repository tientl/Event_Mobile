import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;
  final formKey = GlobalKey<FormState>();
  final UserRepositories userRepositories;

  LoginController(this.userRepositories);

  onclickLoginbtn() {
    Get.offAllNamed(AppRoutes.homePage);
  }

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
      // AlertDialogWidget.show();
    } else if (formKey.currentState!.validate()) {}
  }
}
