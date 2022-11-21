class Event {
  final int id;
  final String? name;
  final String? company;
  final String? urlImage;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  bool isComfirm;

  Event(
      {required this.id,
      this.name,
      this.company,
      this.urlImage,
      this.dateStart,
      this.dateEnd,
      this.isComfirm = false});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      company: json['company_name'] ?? '',
      urlImage: json['url_image'] ?? '',
      dateStart: json['date_begin'] == null
          ? null
          : DateTime.parse(json['date_begin']),
      dateEnd:
          json['date_end'] == null ? null : DateTime.parse(json['date_end']),
      isComfirm: json['is_confirm'] ?? false);

  static List<Event>? getListEventFromJson(List? listEventJson) {
    if (listEventJson == null) return null;
    final listEvent =
        listEventJson.map((event) => Event.fromJson(event)).toList();
    return listEvent;
  }
}
