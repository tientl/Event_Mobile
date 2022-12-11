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

  String get mmyyyy{
    return DateFormat('MM/yyyy').format(this);
  }

  String get weekDateAndDate => '$weekDayString, $ddmmyyyy ';

  
  String get weekDayString {
    switch (weekday) {
      case 1:
        return 'Thứ 2';
      case 2:
        return 'Thứ 3';
      case 3:
        return 'Thứ 4';
      case 4:
        return 'Thứ 5';
      case 5:
        return 'Thứ 6';
      case 6:
        return 'Thứ 7';
      default:
        return 'Chủ nhật';
    }
  }

  
  bool isSameDate(DateTime? other) {
    return other == null ? false : year == other.year && month == other.month && day == other.day;
  }

}
