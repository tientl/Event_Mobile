import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_flatform_widget.dart';
import 'package:event_app/src/data/model/enum/setting_option.dart';
import 'package:event_app/src/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEventController extends GetxController{
   final currentuser = Rxn<User>(null);
  final settingOption = [
    SettingOption.changePass,
    SettingOption.notify,
    SettingOption.help,
  ];

  @override
  void onInit() {
    currentuser.value = AppManager().currentUser;
    super.onInit();
  }

  @override
  void onReady() {
    // if (!AppManager().isLogged()) {
    //   AlertDialogWidget.show(onPress: (() => Get.close(2)));
    // }
    super.onReady();
  }

  onTapSettingOption(SettingOption option) {
    switch (option) {
      case SettingOption.changePass:
      case SettingOption.notify:
      case SettingOption.theme:
      case SettingOption.help:
        //TODO: Navigate to the respective page
        break;
      default:
    }
  }

  showAlertConfirmLogOut(BuildContext context) async {
    AlertDialogFlatform.show(
        context: context,
        title: 'Đăng xuất'.tr,
        content: 'Bạn có chắc muốn đăng xuất'.tr,
        onConfirm: () async => await singout(),
        cancelActionText: 'Hủy'.tr);
  }

  singout() async {
   // await AppManager().signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}