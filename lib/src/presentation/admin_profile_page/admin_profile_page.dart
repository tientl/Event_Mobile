import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/enum/setting_option.dart';
import 'package:event_app/src/presentation/admin_profile_page/admin_profile_controller.dart';
import 'package:event_app/src/presentation/profile_event/widget/setting_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminProfilePage extends GetView<AdminProfileController> {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Tài khoản'.tr,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 16.h,
        ),
        SettingOptionWidget(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Thông tin tài khoản'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).dividerColor),
              )
            ],
          ),
          pre: InternetImageWidget(
            height: 52.r,
            width: 52.r,
            imgUrl: null,
            borderRadius: 100.r,
          ),
        ),
        Divider(
          height: 40.h,
          color: Theme.of(context).dividerColor.withOpacity(0.5),
        ),
        Text(
          'Cài đặt'.tr,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          height: 32.h,
          color: Theme.of(context).dividerColor.withOpacity(0.5),
        ),
        SettingOptionWidget(
          title: Text(
            SettingOption.signout.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          color: SettingOption.signout.getColor(context),
          icon: SettingOption.signout.icon,
          onTap: () async => await controller.showAlertConfirmLogOut(context),
        ),
        Divider(
          height: 0,
          color: Theme.of(context).dividerColor.withOpacity(0.5),
        ),
      ]),
    ));
  }

  Widget getSwitchDependFlatform(BuildContext context) {
    return GetPlatform.isIOS
        ? CupertinoSwitch(
            value: false,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool value) {},
          )
        : Switch(
            value: false,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool value) {});
  }
}
