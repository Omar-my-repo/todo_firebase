import 'package:flutter/material.dart';
import 'package:route_todoapp/style/color.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: colorGreen,
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: colorGreen,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: primaryColor,
      onSurface: Colors.black45,
      background: colorGreen,
      onBackground: Colors.white,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 25, color: primaryColor),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 26),
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: colorGreen,
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: colorGreen,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: primaryColor,
      onSurface: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 25, color: primaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey),
  );
}
