import 'package:event_app/src/app/app_binding.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/app/app_routes/page_routes.dart';
import 'package:event_app/src/presentation/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: const LoginPage(),
        title: 'Event App',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: AppPages.routes,
        initialRoute: AppRoutes.login,
        initialBinding: AppBinding(),
       );
  }
}
