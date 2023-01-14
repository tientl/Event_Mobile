import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_flatform_widget.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/data/model/enum/setting_option.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:event_app/src/data/model/user.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileEventController extends GetxController {
  final UserRepositories userRepository;

  ProfileEventController(this.userRepository);
  final currentuser = Rxn<User>(null);
  final formKey = const GlobalObjectKey<FormState>(2);
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final addAppBar = false.obs;
  final settingOption = [
    SettingOption.changePass,
    SettingOption.notify,
    SettingOption.help,
  ];

  @override
  void onInit() {
    addAppBar.value = Get.arguments == true;
    currentuser.value = AppManager().currentUser;
    super.onInit();
  }

  onValidRating(String? newPass) {
    if (newPass == null || newPass.isEmpty) {
      return "Vui lòng nhập mật khẩu mới";
    }
  }

  onValidConfirmPass(String? confirmPass) {
    if (confirmPassController.text.trim() != newPassController.text.trim()) {
      return 'Xác nhận mật khẩu sai';
    }
  }

  onTapSettingOption(SettingOption option, BuildContext context) {
    switch (option) {
      case SettingOption.changePass:
        showAlertConfirmChangePass(context);
        break;
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

  onChangePass() async {
    if (!formKey.currentState!.validate()) return;
    final changePassRes = await userRepository.changePass(
        userId: currentuser.value!.id, newPass: newPassController.text);
    if (changePassRes.isSuccess()) {
      Get.back();
      AlertDialogWidget.show(
          content: 'Bạn đã đổi mật khẩu thành công',
          typeOfDialog: TypeOfDialog.success);
    } else {
      Get.back();
      AlertDialogWidget.show(content: changePassRes.message);
    }
  }

  showAlertConfirmChangePass(BuildContext context) async {
    newPassController.text = '';
    confirmPassController.text = '';
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Column(
                children: [
                  Text(
                    'Đổi mật khẩu',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff0F2851),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Mật khẩu mới nên khác với mật khẩu hiện tại',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8A96BC), fontSize: 14.sp),
                  )
                ],
              ),
              content: Column(children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => onValidRating(value),
                        controller: newPassController,
                        decoration: InputDecoration(
                            hintText: 'Nhập mật khẩu mới',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff8A96BC)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0F2851)
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0F2851)
                                        .withOpacity(0.2)))),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        validator: (value) => onValidConfirmPass(value),
                        controller: confirmPassController,
                        decoration: InputDecoration(
                            hintText: 'Nhập lại mật khẩu mới',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff8A96BC)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0F2851)
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0F2851)
                                        .withOpacity(0.2)))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ButtonWidget(
                  lable: 'Đổi mật khẩu',
                  borderRadius: BorderRadius.circular(8.r),
                  onPressed: () async => onChangePass(),
                )
              ]),
            ));
  }
}
