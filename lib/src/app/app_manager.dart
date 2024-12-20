import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/data/model/user.dart';

class AppManager {
  static final AppManager _singleton = AppManager._internal();

  factory AppManager() => _singleton;

  AppManager._internal();
  Map<String, String>? authHeader;
  User? _currentUser;
  User? get currentUser => _currentUser;
  Event? _currentEvent;
  Event? get currentEvent => _currentEvent;

  isSignIn() => _currentUser != null;

  Future<void> onLogin(User user) async {
    _currentUser = user;
  }

  updateCurrentEvent (Event event) {
    _currentEvent = event;
  }
}
