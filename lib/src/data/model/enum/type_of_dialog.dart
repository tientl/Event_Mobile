import 'package:event_app/src/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TypeOfDialog { success, error }

extension TypeOfDialogExt on TypeOfDialog {
  String get iconPath {
    switch (this) {
      case TypeOfDialog.error:
        return "assets/images/default/error.png";
      default:
        return "assets/images/default/success.png";
    }
  }

  String get title {
    switch (this) {
      case TypeOfDialog.error:
        return "error".tr;
      default:
        return "success".tr;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (this) {
      case TypeOfDialog.error:
      case TypeOfDialog.success:
        return Theme.of(context).backgroundColor;
      default:
        return Theme.of(context).backgroundColor;
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case TypeOfDialog.error:
        return Theme.of(context).errorColor;
      case TypeOfDialog.success:
        return Theme.of(context).primaryColor;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    switch (this) {
      case TypeOfDialog.error:
        return CommonStyle.containedButtonStyle(
            context: context, backgroundColor: getColor(context));
      default:
        return CommonStyle.containedButtonStyle(context: context);
    }
  }
}
