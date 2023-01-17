// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDG3xCgo-fQtbcoFbupMvAGkG537eww-HQ',
    appId: '1:885871119008:web:43a24cfddf7ddb7e7857c5',
    messagingSenderId: '885871119008',
    projectId: 'event-app-c9418',
    authDomain: 'event-app-c9418.firebaseapp.com',
    storageBucket: 'event-app-c9418.appspot.com',
    measurementId: 'G-VJB9CMGSMK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxgcX-H97YOtRnZx1EyCgQwj3tU7kezuc',
    appId: '1:885871119008:android:77c3dacb1baf38eb7857c5',
    messagingSenderId: '885871119008',
    projectId: 'event-app-c9418',
    storageBucket: 'event-app-c9418.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeRFBwQ2lPCK9kyLNpuo9_Wv2xzcQ7ie4',
    appId: '1:885871119008:ios:2862d7a653c340137857c5',
    messagingSenderId: '885871119008',
    projectId: 'event-app-c9418',
    storageBucket: 'event-app-c9418.appspot.com',
    iosClientId: '885871119008-fu4evflnc5cplkp7n9sg5boa61f2f45j.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeRFBwQ2lPCK9kyLNpuo9_Wv2xzcQ7ie4',
    appId: '1:885871119008:ios:2862d7a653c340137857c5',
    messagingSenderId: '885871119008',
    projectId: 'event-app-c9418',
    storageBucket: 'event-app-c9418.appspot.com',
    iosClientId: '885871119008-fu4evflnc5cplkp7n9sg5boa61f2f45j.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventApp',
  );
}