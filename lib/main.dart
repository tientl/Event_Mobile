import 'package:event_app/src/app/app_binding.dart';
import 'package:event_app/src/app/app_config/app_theme.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/app/app_routes/page_routes.dart';
import 'package:event_app/src/presentation/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final token = await messaging.getToken();
  messaging.getToken().then((String? token) {
    assert(token != null);
    debugPrint("Push Messaging token: $token");
  });
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification?.body}');
      }
    });
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification?.body}');
      }
    });
  } else {
    print('User declined or has not accepted permission');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 843),
        builder: ((context, child) {
          return GetMaterialApp(
            home: const LoginPage(),
            title: 'Event App',
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            getPages: AppPages.routes,
            initialRoute: AppRoutes.login,
            initialBinding: AppBinding(),
            //  localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   DefaultWidgetsLocalizations.delegate
            //https://www.youtube.com/watch?v=2tjuUwNx6qk&t=17s
            // ],
          );
        }));
  }
}
