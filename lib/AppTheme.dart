import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path/path.dart';

class AppTheme{
  AppTheme._();

  static const Color colorOrange = Color(0xfffc9c00);
  static const Color colorBackgroungScaffold = Color(0xfff1f4fd);
  static const Color colorTitleShowProduct1 = Color(0xffffffff);
  static const Color colorTitleShowProduct2 = Color(0xfffc9c00);
  static const Color colorTextTitle = Color(0xfffc9c00);
  static const Color colorTextAppbar = Color(0xffffffff);
  static const Color colorTextPrice = Color(0xfffc2600);
  static const Color colorTextUnPriceGrey = Color(0xffa6a6a6);
  static const Color colorbottomNavbar = Color(0xfff5f5f5);
  static const Color colorItemOnSearch = Color(0xffa6a6a6);
  static const Color colorAppbar = Color(0xffff9800);
  static const List<Color> colorListNav = <Color>[Color(0xff34bccc),Color(0xfffdb434),Color(0xff45b249),Color
    (0xffff6223),];

}


final ThemeData themeData = new ThemeData(
  scaffoldBackgroundColor: Color(0xffeaeaea),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.orange,
    backgroundColor: Color.fromARGB(255,250,250,250),
    accentColor: Colors.redAccent,
    buttonTheme: ButtonThemeData(
        splashColor: Colors.orange.shade700,
        buttonColor: Colors.orange.shade400
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
        ),
        headline2: TextStyle(
          fontSize: 20,
        ),
        headline3: TextStyle(
          fontSize: 15,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.grey
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 15,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.black
        ),
        caption: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16
        ),
        button: TextStyle(
            color: Colors.white,
            fontSize: 20
        )
    )
);