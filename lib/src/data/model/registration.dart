class Registration {
  final int id;
   String? name;
   String? email;
   String? mobile;
   String? urlImage;
   String? ticket;
   String? company;
   String? role;
   String? function;
   bool? isCheckIn;
   DateTime? checkIntime;

  Registration(
      {required this.id,
      this.name,
      this.urlImage,
      this.email,
      this.mobile,
      this.company,
      this.ticket,
      this.isCheckIn,
      this.function,
       this.checkIntime,
        this.role});

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        urlImage: json['image_url'] ?? '',
        email: json['email'] ?? '',
        mobile: json['mobile'] ?? '',
        ticket: json['ticket'] ?? '',
        company: json['company'] ?? '',
        function: json['function'] ?? '',
        isCheckIn: json['is_check_in'] ?? false,
        checkIntime: json['checkin_time'] == null ? null : DateTime.parse(json['checkin_time'])
      );

  static List<Registration>? getListRegistrationFromJson(
      List? listRegistrationJson) {
    if (listRegistrationJson == null) return null;
    final listRegistration = listRegistrationJson
        .map((registrations) => Registration.fromJson(registrations))
        .toList();
    return listRegistration;
  }

  updateCheckInTime(DateTime dateTime){
    isCheckIn = true;
    checkIntime = dateTime;
  }
}
