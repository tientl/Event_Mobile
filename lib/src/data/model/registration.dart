class Registration {
  final int id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? urlImage;
  final String? ticket;
  final String? company;
  final String? function;

  Registration(
      {required this.id,
      this.name,
      this.urlImage,
      this.email,
      this.mobile,
      this.company,
      this.ticket,
      this.function});

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        urlImage: json['image_url'] ?? '',
        email: json['email'] ?? '',
        mobile: json['mobile'] ?? '',
        ticket: json['ticket'] ?? '',
        company: json['company'] ?? '',
        function: json['function'] ?? '',
      );

  static List<Registration>? getListRegistrationFromJson(
      List? listRegistrationJson) {
    if (listRegistrationJson == null) return null;
    final listRegistration = listRegistrationJson
        .map((registrations) => Registration.fromJson(registrations))
        .toList();
    return listRegistration;
  }
}
