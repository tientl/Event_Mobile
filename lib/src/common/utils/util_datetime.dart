import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get ddmmyyyy {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get ddmmyyyHHmmss {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(this);
  }

  String get hhmmddmmyyyy {
    return DateFormat('HH:mm dd/MM/yyyy').format(this);
  }

  String get mmss {
    return DateFormat('mm:ss').format(this);
  }

  String get hhmm {
    return DateFormat('HH:mm').format(this);
  }
  
  String get weekDayString {
    switch (weekday) {
      case 1:
        return 'Th 2';
      case 2:
        return 'Th 3';
      case 3:
        return 'Th 4';
      case 4:
        return 'Th 5';
      case 5:
        return 'Th 6';
      case 6:
        return 'Th 7';
      default:
        return 'CN';
    }
  }

}
