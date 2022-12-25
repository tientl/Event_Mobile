import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

enum SettingOption { changePass, notify, theme, help, signout }

extension SettingOptionExt on SettingOption {
  String get name {
    switch (this) {
      case SettingOption.changePass:
        return 'Đối mật khẩu'.tr;
      case SettingOption.notify:
        return 'Thông báo'.tr;
      case SettingOption.help:
        return 'Giúp đỡ'.tr;
      case SettingOption.signout:
        return 'Đăng xuất'.tr;
      default:
        return 'Đổi mật khẩu'.tr;
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case SettingOption.changePass:
        return Theme.of(context).primaryColor;
      case SettingOption.notify:
        return Theme.of(context).secondaryHeaderColor;
      case SettingOption.theme:
        return Theme.of(context).indicatorColor.withBlue(-30);
      case SettingOption.help:
        return Theme.of(context).errorColor;
      case SettingOption.signout:
        return Theme.of(context).canvasColor;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  IconData get icon {
    switch (this) {
      case SettingOption.changePass:
        return FontAwesomeIcons.key;
      case SettingOption.notify:
        return FontAwesomeIcons.solidBell;
      case SettingOption.theme:
        return FontAwesomeIcons.solidMoon;
      case SettingOption.help:
        return FontAwesomeIcons.circleInfo;
      case SettingOption.signout:
        return FontAwesomeIcons.rightFromBracket;
      default:
        return FontAwesomeIcons.globe;
    }
  }
}
