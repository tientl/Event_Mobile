import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_flatform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfileController extends GetxController{

    showAlertConfirmLogOut(BuildContext context) async {
      
    AlertDialogFlatform.show(
        context: context,
        title: 'Đăng xuất'.tr,
        content: 'Bạn có chắc muốn đăng xuất'.tr,
        onConfirm: () async => await singout(),
        cancelActionText: 'Hủy'.tr);
  }

  
  singout() async {
    Get.offAllNamed(AppRoutes.login);
  }
}