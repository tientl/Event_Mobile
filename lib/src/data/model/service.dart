class Service {
  final int id;
  bool isChoice;
  String? name;
  bool? isEdit;
  String? requiredAnswer;

  Service({required this.id, this.name, this.isChoice = false, this.isEdit});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
      id: json['id'] ?? 0,
      name: json['name'],
      isEdit: json['is_edit'] ?? false);

  Map<String, dynamic> toJson() => {
        'id': id,
        'required_answer': requiredAnswer,
        'name': name,
      };

  static getSevicesFromJson(List? json) {
    if (json == null) return null;

    return json.map((e) => Service.fromJson(e)).toList();
  }
}
