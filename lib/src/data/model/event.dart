import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/data/model/sponsor.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';

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

  List<DateTime> get listDate  {
    if (dateStart == null) return [];
    late DateTime date = dateStart!;
    late List<DateTime> listDate = [];
    while (date != dateEnd){
      listDate.add(date);
      date = date.add( const Duration(days: 1));
    }
    return listDate;
  }


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
      });

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
      speakers: json['speakers'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['speakers']),
           listSubScheduler: json['sub_schedules'] == null
          ? null
          : SubSchedule.getListSubScheduler(json['sub_schedules'] as List));

  static List<Event>? getListEventFromJson(List? listEventJson) {
    if (listEventJson == null) return null;
    final listEvent =
        listEventJson.map((event) => Event.fromJson(event)).toList();
    return listEvent;
  }
}
