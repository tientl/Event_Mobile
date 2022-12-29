import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { adminHome, qrScanner, adminProfile, home, schedule, barcode, profile }

extension TabItemExt on TabItem {
  String get name {
    switch (this) {
      case TabItem.home:
        return 'Trang chủ';
      case TabItem.schedule:
        return 'Lịch trình';
      case TabItem.barcode:
        return 'Barcode';
      case TabItem.profile:
        return 'Hồ sơ';
      case TabItem.adminHome: 
      return 'Trang chủ';
      case TabItem.adminProfile:
      return 'Hồ sơ';
      case TabItem.qrScanner:
      return 'Quét mã QR';
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
        case TabItem.adminHome: 
        return FontAwesomeIcons.house;
      case TabItem.barcode:
        return FontAwesomeIcons.qrcode;
      case TabItem.schedule:
        return FontAwesomeIcons.solidCalendar;
      case TabItem.profile:
      case TabItem.adminProfile:
        return FontAwesomeIcons.solidUser;
    case TabItem.qrScanner:
    return Icons.qr_code_scanner;
      default:
        return FontAwesomeIcons.houseChimneyMedical;
    }
  }
}
