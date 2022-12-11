import 'package:event_app/src/data/model/registration.dart';

class Presentation {
  final int id;
  String? name;
  List<Registration>? speaker;

  Presentation({required this.id, this.name, this.speaker});

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      speaker: json['speaker'] == null
          ? null
          : Registration.getListRegistrationFromJson(json['speaker'] as List));

  static List<Presentation>? getListPresentFromJson(List? json) {
    if (json == null) return null;

    return json.map((e) => Presentation.fromJson(e)).toList();
  }
}
