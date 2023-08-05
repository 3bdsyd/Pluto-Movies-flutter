import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/colors_utils.dart';

class ThemeApp {
  static final light = ThemeData(
    scaffoldBackgroundColor: ColorsUtils.backgroundColor,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        color: ColorsUtils.mainColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        fontFamily: 'Caprasimo',
      ),
      titleLarge: TextStyle(
        fontSize: 25.sp,
        color: Colors.black,
        fontFamily: 'Rubik',
      ),
      bodyLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        letterSpacing: 1,
        fontFamily: 'Rubik',
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: const Color.fromARGB(255, 0, 0, 0),
        letterSpacing: 1,
        fontFamily: 'Rubik',
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        letterSpacing: 1,
        fontFamily: 'Rubik',
      ),
      labelLarge: TextStyle(
        fontSize: 15.sp,
        color: Colors.black,
        letterSpacing: 1,
        fontFamily: 'Rubik',
      ),
      labelMedium: TextStyle(
        fontSize: 15.sp,
        color: Colors.black,
        fontFamily: 'Rubik',
      ),
      labelSmall: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Rubik',
      ),
    ),
  );
}
