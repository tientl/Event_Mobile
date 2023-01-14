import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/data/model/service.dart';
import 'package:event_app/src/data/model/sponsor.dart';
import 'package:event_app/src/data/model/stall.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class Event {
  final int id;
  String? name;
  String? company;
  String? eventImage;
  String? mapImage;
  DateTime? dateStart;
  DateTime? dateEnd;
  bool isComfirm;
  String? address;
  String? description;
  List<Sponsor>? sponsor;
  List<Registration>? registrations;
  List<Registration>? speakers;
  List<SubSchedule>? listSubScheduler;
  List<Stall>? listStall;
  List<Service>? services;

  int get totalUnCheckIn {
    if (registrations == null) return 0;
    return registrations!.where((element) => element.isCheckIn != true).length;
  }

  List<DateTime> get listDate {
    if (dateStart == null) return [];
    late DateTime date = dateStart!;
    late List<DateTime> listDate = [];
    while (date.isSameDate(dateEnd)) {
      listDate.add(date);
      date = date.add(const Duration(days: 1));
    }
    return listDate;
  }

  bool? get isAlreadyOver =>
      dateEnd == null ? null : dateEnd!.isBefore(DateTime.now());

  Event(
      {required this.id,
      this.name,
      this.company,
      this.eventImage,
      this.mapImage,
      this.dateStart,
      this.dateEnd,
      this.isComfirm = false,
      this.address,
      this.description,
      this.sponsor,
      this.registrations,
      this.speakers,
      this.listSubScheduler,
      this.listStall,
      this.services});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      company: json['company_name'] ?? '',
      eventImage: json['event_image'] ?? '',
      mapImage: json['map_image'] ?? '',
      dateStart: json['date_begin'] == null
          ? null
          : DateTime.parse(json['date_begin']),
      dateEnd:
          json['date_end'] == null ? null : DateTime.parse(json['date_end']),
      isComfirm: json['is_confirm'] ?? false,
      description: json['event_description'] ?? 'Chưa có thông tin giới thiệu',
      address: json['address'] ?? '',
      sponsor: json['sponsors'] == null
          ? null
          : Sponsor.getListSponsorFromJson(json['sponsors']),
      registrations: json['registrations'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['registrations']),
      listStall: json['booths'] == null
          ? null
          : Stall.getListStallFromJson(json['booths']),
      speakers: json['speakers'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['speakers']),
      listSubScheduler: json['sub_schedules'] == null
          ? null
          : SubSchedule.getListSubScheduler(json['sub_schedules'] as List),
      services: json['services'] == null
          ? null
          : Service.getSevicesFromJson(json['services'] as List));

  static List<Event>? getListEventFromJson(List? listEventJson) {
    if (listEventJson == null) return null;
    final listEvent =
        listEventJson.map((event) => Event.fromJson(event)).toList();
    return listEvent;
  }

  updateCheckIn(int id) {
    if (registrations == null) return;
    final index = registrations!.indexWhere((element) => element.id == id);
    registrations![index].checkIntime = DateTime.now();
  }
}
