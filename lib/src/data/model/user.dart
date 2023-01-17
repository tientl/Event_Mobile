import 'package:event_app/src/data/model/event.dart';

class User {
  final int id;
  final String? avatarUrl;
  final String? userName;
  final String? passWord;
  final String? mobile;
  final String? email;
  final String? fullName;
  final String? position;
  final String? company;
  final List<Event>? listEvent;
  final bool? isAdmin;
  List<Event>? get listUnconfirmEvent => listEvent == null
      ? null
      : listEvent!
          .where(
            (element) => element.isComfirm == false,
          )
          .toList();
  List<Event>? get listConfirmEvent => listEvent == null
      ? null
      : listEvent!
          .where(
            (element) => element.isComfirm == true,
          )
          .toList();

  User(
      {required this.id,
      this.userName,
      this.mobile,
      this.email,
      this.fullName,
      this.passWord,
      this.listEvent,
      this.isAdmin,
      this.avatarUrl,
      this.company,
      this.position});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'] ?? 0,
      isAdmin: json['is_admin'] ?? false,
      avatarUrl: json['avatar_url'] ?? '',
      userName: json['user_name'] ?? '',
      passWord: json['password'] ?? '',
      fullName: json['full_name'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
      listEvent: json['events'] == null
          ? null
          : Event.getListEventFromJson(json['events'] as List),
      position: json['position'] ?? '',
      company: json['company'] ?? '');
}
