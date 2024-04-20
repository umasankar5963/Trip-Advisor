import 'dart:ui';
import 'package:flutter/material.dart';

class Constants{
  static String appname='Trip Advisor';
  
  //colors themes
  static Color dividerClr=Colors.black87;
  static Color buttonscolor=Colors.blueAccent;
  static Color buildpage1=Colors.green.shade100;
  static Color buildpage2=Colors.blue.shade100;
  static Color buildpage3=Colors.amber.shade100;
  static Color activedot=Colors.teal.shade700;
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color? lightAccent = Colors.blueGrey[900];
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;
  static Color sideMenu=  Color(0xff17203A);
  static Color sideMenuSltIndx=Color(0xFF6792FF);
  static Color unratedclr=Colors.grey;
  static Color rating=Colors.amber;
  static Color boxshadow=Colors.black26;
 //text color themes
 static Color whiteColorBg=Colors.white;

 //light theme
 static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0, toolbarTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).bodyMedium, titleTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).titleMedium,
    ), 
    colorScheme: ColorScheme.fromSwatch(accentColor: lightAccent,backgroundColor: lightBG,brightness: Brightness.light ),);
//dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0, toolbarTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).bodyMedium, titleTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).titleMedium,
    ), colorScheme: ColorScheme.fromSwatch(accentColor: darkAccent,backgroundColor: darkBG,brightness: Brightness.dark),
  );

//font styles
static const categoeryheader= TextStyle(fontSize: 20,fontWeight:FontWeight.w800,color: Colors.black);
static const budgetcost= TextStyle(fontSize: 12,fontWeight:FontWeight.bold,color: Colors.black);
static const indiaplcesHeader=TextStyle(fontSize: 20,fontWeight:FontWeight.w800,color: Colors.black,);
static const subtitle= TextStyle(fontSize: 13,fontWeight:FontWeight.w800,color: Colors.black26,);
static const listTileTitle=TextStyle(fontWeight: FontWeight.w800,color: Colors.black);
static const placedetails=TextStyle(color: Colors.black,fontSize: 17);
static const timings=TextStyle(color:Colors.black45,fontSize: 17);










}
