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
}
