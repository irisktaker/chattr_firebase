import 'package:flutter/material.dart';

//... DARK MODE
final darkThemeMode = ThemeData.dark().copyWith(
  // scaffoldBackgroundColor: Colors.black,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.black,
  primaryColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.grey),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 56),
      primary: const Color(0xFFEF5350),
      onPrimary: const Color(0xffE8E8E8),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        /* 
            padding: ...,
            textStyle: ...,
            ... 
            */
        ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Color(0xFFEF5350),
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
);

//... LIGHT MODE
final lightThemeMode = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.black,
  primaryColorLight: Colors.black,
  canvasColor: Colors.white,
  // primaryColorDark: Colors.white,

  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: const Color(0xFF414361),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 56),
      primary: const Color(0xFFf59400),
      onPrimary: const Color(0xFF414361),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        /* 
            padding: ...,
            textStyle: ...,
            ... 
            */
        ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF2a2d43),
    unselectedItemColor: Color(0xFF414361),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF414361),
    elevation: 0,
    centerTitle: true,
  ),
);
