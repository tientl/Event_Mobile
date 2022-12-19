//id, name, img_url, company, level, desc

class Stall {
  final int id;
  String? name;
  String? imgUrl;
  String? company;
  String? level;
  String? desc;
  String? email;

  Stall(
      {required this.id,
      this.company,
      this.desc,
      this.imgUrl,
      this.level,
      this.email,
      this.name});

  factory Stall.fromJson(Map<String, dynamic> json) => Stall(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      company: json['company'] ?? '',
      desc: json['desc'] ?? '',
      level: json['level'] ?? '',
      email: json['email'] ?? '',
      imgUrl: json['img_url'] ?? '');
  
    static List<Stall>? getListStallFromJson(
      List? listStallJson) {
    if (listStallJson == null) return null;
    final listStall = listStallJson
        .map((stalls) => Stall.fromJson(stalls))
        .toList();
    return listStall;
  }
}
