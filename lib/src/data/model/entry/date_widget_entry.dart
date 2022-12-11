import 'package:event_app/src/common/utils/util_datetime.dart';

class DateWidgetEntry{
  final DateTime value;

  String get date => value.day.toString();
  String get weekDate => value.weekDayString;

  DateWidgetEntry({required this.value});
}