class Sponsor {
  final int id;
  final String? name;
  final String? company;
  final String? sponsorType;
  final String? slogan;
  final String? email;
  final String? mobile;
  final String? urlImage;
  final String? urlSponsor;

  Sponsor(
      {required this.id,
      this.name,
      this.company,
      this.urlImage,
      this.sponsorType,
      this.slogan,
      this.email,
      this.mobile,
      this.urlSponsor});

  factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        company: json['company_name'] ?? '',
        urlImage: json['image_url'] ?? '',
        sponsorType: json['sponsor_type'] ?? '',
        slogan: json['slogan'] ?? '',
        email: json['email'] ?? '',
        mobile: json['mobile'] ?? '',
        urlSponsor: json['urlSponsor'] ?? '',
      );

  static List<Sponsor>? getListSponsorFromJson(List? listSponsorJson) {
    if (listSponsorJson == null) return null;
    final listSponsor =
        listSponsorJson.map((sponsor) => Sponsor.fromJson(sponsor)).toList();
    return listSponsor;
  }
}
