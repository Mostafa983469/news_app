import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData LightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.blue,
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
) ;

ThemeData DarkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black26,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.black26,
    titleTextStyle: TextStyle(
      fontSize: 30.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black26,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.blue,
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
) ;