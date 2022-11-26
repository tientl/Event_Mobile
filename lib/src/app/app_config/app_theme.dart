import 'package:event_app/src/app/app_config/app_color.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "roboto",
    primaryColor: AppColors.kFFFF0F75BD,
    scaffoldBackgroundColor: Color.fromARGB(255, 238, 244, 250),
    canvasColor: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.kFF6B779A),
    textTheme: const TextTheme(
        headline4: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.white),
        headline5: TextStyle(
            fontSize: 24, color: AppColors.white, fontWeight: FontWeight.bold),
        headline6: TextStyle(
          fontSize: 20,
          color: AppColors.white,
        ),
        bodyText1: TextStyle(
            fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 14, color: AppColors.white),
        button: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
        caption: TextStyle(fontSize: 12, color: AppColors.white),
        overline: TextStyle(fontSize: 10, color: AppColors.white)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.white));
