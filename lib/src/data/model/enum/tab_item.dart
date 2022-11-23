import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { home, schedule, barcode, profile }

extension TabItemExt on TabItem {
  String get name {
    switch (this) {
      case TabItem.home:
        return 'Trang chủ';
      case TabItem.barcode:
        return 'Lịch trình';
      case TabItem.schedule:
        return 'Barcode';
      case TabItem.profile:
        return 'Hồ sơ';
    }
  }

  Color getSelectedColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  Color getUnSelectedColor(BuildContext context) {
    return Theme.of(context).canvasColor;
  }

  IconData get icon {
    switch (this) {
      case TabItem.home:
        return FontAwesomeIcons.houseChimneyMedical;
      case TabItem.barcode:
        return FontAwesomeIcons.book;
      case TabItem.schedule:
        return FontAwesomeIcons.arrowsSpin;
      case TabItem.profile:
        return FontAwesomeIcons.solidUser;
      default:
        return FontAwesomeIcons.houseChimneyMedical;
    }
  }
}
