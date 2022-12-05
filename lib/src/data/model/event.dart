import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/data/model/speaker.dart';
import 'package:event_app/src/data/model/sponsor.dart';

class Event {
  final int id;
  final String? name;
  final String? company;
  final String? eventImage;
  final String? mapImage;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  bool isComfirm;
  String? address;
  String? description;
  final List<Sponsor>? sponsor;
  final List<Registration>? registrations;
  final List<Speaker>? speakers;

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
      this.speakers});

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
      description: json['event_description'] ?? '',
      address: json['address'] ?? '',
      sponsor: json['sponsors'] == null
          ? null
          : Sponsor.getListSponsorFromJson(json['sponsors']),
      registrations: json['registrations'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['registrations']),
      speakers: json['speakers'] == null
          ? null
          : Speaker.getListSpeakerFromJson(json['speakers']));

  static List<Event>? getListEventFromJson(List? listEventJson) {
    if (listEventJson == null) return null;
    final listEvent =
        listEventJson.map((event) => Event.fromJson(event)).toList();
    return listEvent;
  }
}
