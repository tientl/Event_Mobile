import 'package:event_app/src/app/app_binding.dart';
import 'package:event_app/src/app/app_config/app_theme.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/app/app_routes/page_routes.dart';
import 'package:event_app/src/presentation/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
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
             localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate
            ],
          );
        }));
  }
}
