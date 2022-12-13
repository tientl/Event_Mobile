import 'package:event_app/src/data/model/registration.dart';

class Presentation {
  final int id;
  String? name;
  String? desc;
  List<Registration>? speaker;

   String get listSpeakerName {
     late String result = '';
    speaker
        ?.forEach((e) { if (e.name != null) result += e.name!;} );
        return result;
   }
  Presentation({required this.id, this.name, this.speaker, this.desc});

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      desc: json['desciption'] ?? 'Chưa có mô tả chi tiết',
      speaker: json['speaker'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['speaker'] as List));

  static List<Presentation>? getListPresentFromJson(List? json) {
    if (json == null) return null;

    return json.map((e) => Presentation.fromJson(e)).toList();
  }
}
