class Speaker {
  final int id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? urlImage;
  final String? ticket;
  final String? company;
  final String? function;

  Speaker(
      {required this.id,
      this.name,
      this.urlImage,
      this.email,
      this.mobile,
      this.company,
      this.ticket,
      this.function});

  factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        urlImage: json['image_url'] ?? '',
        email: json['email'] ?? '',
        mobile: json['mobile'] ?? '',
        ticket: json['ticket'] ?? '',
        company: json['company'] ?? '',
        function: json['function'] ?? '',
      );

  static List<Speaker>? getListSpeakerFromJson(
      List? listSpeakerJson) {
    if (listSpeakerJson == null) return null;
    final listSpeaker = listSpeakerJson
        .map((speaker) => Speaker.fromJson(speaker))
        .toList();
    return listSpeaker;
  }
}
