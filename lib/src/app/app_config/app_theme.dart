import 'package:event_app/src/app/app_config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.kFFFFFFFF,
    primaryColor: AppColors.kFFFF0F75BD,
    toggleableActiveColor: AppColors.kFFFF0F75BD,
    canvasColor: AppColors.kFF0F2851,
    errorColor: AppColors.kFFF1592A,
    hintColor: AppColors.kFFAAAAAA,
    highlightColor: AppColors.kFF0D67A7,
    dividerColor: AppColors.kFF8696BB,
    secondaryHeaderColor: AppColors.kFFFCBA06,
    scaffoldBackgroundColor: AppColors.kFFFBFDFF,
    indicatorColor: AppColors.kFF6B779A,
    fontFamily: "roboto",
    iconTheme: const IconThemeData(color: AppColors.kFF6B779A),
    textTheme: TextTheme(
        headline4: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
        headline5: TextStyle(
            fontSize: 24.sp,
            color: AppColors.kFF0F2851,
            fontWeight: FontWeight.bold),
        headline6: TextStyle(
          fontSize: 20.sp,
          color: AppColors.kFF0F2851,
        ),
        bodyText1: TextStyle(
            fontSize: 16.sp,
            color: AppColors.kFF0F2851,
            fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 14.sp, color: AppColors.kFF0F2851),
        button: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.kFFFBFDFF),
        caption: TextStyle(fontSize: 12.sp, color: AppColors.kFFAAAAAA),
        overline: TextStyle(fontSize: 10.sp, color: AppColors.kFF0F2851)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.white));
