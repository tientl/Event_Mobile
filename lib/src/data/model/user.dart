import 'package:event_app/src/data/model/event.dart';

class User {
  final int id;
  final String? userName;
  final String? passWord;
  final List<Event>? listEvent;
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

  User({
    required this.id,
    this.userName,
    this.passWord,
    this.listEvent,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? 0,
        userName: json['user_name'] ?? '',
        passWord: json['password'] ?? '',
        listEvent: json['events'] == null
            ? null
            : Event.getListEventFromJson(json['events'] as List),
      );
}
