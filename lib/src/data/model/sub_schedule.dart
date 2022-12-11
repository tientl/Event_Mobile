import 'package:event_app/src/data/model/presentation.dart';

class SubSchedule {
  final int id;
  String? name;
  DateTime? timeScheduler;
  DateTime? hourStart;
  DateTime? hourEnd;
  double? totalHour;
  String? location;
  String? detail;
  Presentation? presentation;

  SubSchedule(
      {required this.id,
      this.detail,
      this.hourEnd,
      this.hourStart,
      this.presentation,
      this.location,
      this.totalHour,
      this.name,
      this.timeScheduler});

  factory SubSchedule.fromJson(Map<String, dynamic> json) => SubSchedule(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      totalHour: json['total_hour'] ?? 0.0,
      timeScheduler: json['time_schedule'] == null
          ? null
          : DateTime.parse(json['time_schedule']),
      hourStart: json['hour_start'] == null
          ? null
          : DateTime.parse(json['hour_start']),
      hourEnd:
          json['hour_end'] == null ? null : DateTime.parse(json['hour_end']),
      location: json['location'] ?? '',
      detail: json['detail'] ?? 'Không có mô tả',
      presentation: json['presentation'] == null
          ? null
          : Presentation.fromJson(json['presentation']));

  static List<SubSchedule>? getListSubScheduler(List? json) {
    if (json == null) return null;
    return json.map((e) => SubSchedule.fromJson(e)).toList();
  }
}
