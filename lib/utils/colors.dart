// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'package:flutter/material.dart';

enum CustomColor {
  appBar,
  background,
  dark,
  light,
  appBarDark,
  backgroundDark,
  darkDark,
  lightDark
}

class CustomColors {
  static Color appBar = const Color.fromRGBO(211, 233, 231, 1);
  static Color background = const Color.fromRGBO(244, 246, 245, 1);
  static Color dark = const Color.fromRGBO(46, 125, 132, 1);
  static Color light = const Color.fromRGBO(255, 255, 255, 1);

  static Color appBarDark = const Color.fromRGBO(68, 136, 130, 1);
  static Color backgroundDark = const Color.fromRGBO(51, 51, 51, 1);
  static Color darkDark = const Color.fromRGBO(33, 90, 95, 1);
  static Color lightDark = const Color.fromRGBO(61, 61, 61, 1.0);

  static void setColor(CustomColor customColor, Color color) {
    switch (customColor) {
      case CustomColor.appBar:
        appBar = color;
        break;
      case CustomColor.background:
        background = color;
        break;
      case CustomColor.dark:
        dark = color;
        break;
      case CustomColor.light:
        light = color;
        break;
      case CustomColor.appBarDark:
        appBarDark = color;
        break;
      case CustomColor.backgroundDark:
        backgroundDark = color;
        break;
      case CustomColor.darkDark:
        darkDark = color;
        break;
      case CustomColor.lightDark:
        lightDark = color;
        break;
      default:
        break;
    }
  }

// static const int _circlePrimaryValue = 0xFFFAFAFA;
//
// static const MaterialColor circle = MaterialColor(
//   _circlePrimaryValue,
//   <int, Color>{
//     50: Color(0xFFFAFAFA),
//     100: Color(0xFFFAFAFA),
//     200: Color(0xFFFAFAFA),
//     300: Color(0xFFFAFAFA),
//     400: Color(0xFFFAFAFA),
//     500: Color(_circlePrimaryValue),
//     600: Color(0xFFFAFAFA),
//     700: Color(0xFFFAFAFA),
//     800: Color(0xFFFAFAFA),
//     900: Color(0xFFFAFAFA),
//   },
// );
//
// static const int _emotionsPrimaryValue = 0xFFFDF2CC;
//
// static const MaterialColor emotions = MaterialColor(
//   _emotionsPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFFDF2CC),
//     100: Color(0xFFFDF2CC),
//     200: Color(0xFFFDF2CC),
//     300: Color(0xFFFDF2CC),
//     400: Color(0xFFFDF2CC),
//     500: Color(_emotionsPrimaryValue),
//     600: Color(0xFFFDF2CC),
//     700: Color(0xFFFDF2CC),
//     800: Color(0xFFFDF2CC),
//     900: Color(0xFFFDF2CC),
//   },
// );
//
// static const int _painPrimaryValue = 0xFFEAD1DC;
//
// static const MaterialColor pain = MaterialColor(
//   _painPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFEAD1DC),
//     100: Color(0xFFEAD1DC),
//     200: Color(0xFFEAD1DC),
//     300: Color(0xFFEAD1DC),
//     400: Color(0xFFEAD1DC),
//     500: Color(_painPrimaryValue),
//     600: Color(0xFFEAD1DC),
//     700: Color(0xFFEAD1DC),
//     800: Color(0xFFEAD1DC),
//     900: Color(0xFFEAD1DC),
//   },
// );
//
// static const int _rdvPrimaryValue = 0xEFEFEF;
//
// static const MaterialColor rdv = MaterialColor(
//   _rdvPrimaryValue,
//   <int, Color>{
//     50: Color(0xEFEFEF),
//     100: Color(0xEFEFEF),
//     200: Color(0xEFEFEF),
//     300: Color(0xEFEFEF),
//     400: Color(0xEFEFEF),
//     500: Color(_rdvPrimaryValue),
//     600: Color(0xEFEFEF),
//     700: Color(0xEFEFEF),
//     800: Color(0xEFEFEF),
//     900: Color(0xEFEFEF),
//   },
// );
//
// static const int _sophroPrimaryValue = 0xFFD9EAD3;
//
// static const MaterialColor sophro = MaterialColor(
//   _sophroPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFD9EAD3),
//     100: Color(0xFFD9EAD3),
//     200: Color(0xFFD9EAD3),
//     300: Color(0xFFD9EAD3),
//     400: Color(0xFFD9EAD3),
//     500: Color(_sophroPrimaryValue),
//     600: Color(0xFFD9EAD3),
//     700: Color(0xFFD9EAD3),
//     800: Color(0xFFD9EAD3),
//     900: Color(0xFFD9EAD3),
//   },
// );
//
// static const int _talkPrimaryValue = 0xFFD0E0E3;
//
// static const MaterialColor talk = MaterialColor(
//   _talkPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFD0E0E3),
//     100: Color(0xFFD0E0E3),
//     200: Color(0xFFD0E0E3),
//     300: Color(0xFFD0E0E3),
//     400: Color(0xFFD0E0E3),
//     500: Color(_talkPrimaryValue),
//     600: Color(0xFFD0E0E3),
//     700: Color(0xFFD0E0E3),
//     800: Color(0xFFD0E0E3),
//     900: Color(0xFFD0E0E3),
//   },
// );
//
// static const int _medicPrimaryValue = 0xFFFCE5CD;
//
// static const MaterialColor medic = MaterialColor(
//   _medicPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFFCE5CD),
//     100: Color(0xFFFCE5CD),
//     200: Color(0xFFFCE5CD),
//     300: Color(0xFFFCE5CD),
//     400: Color(0xFFFCE5CD),
//     500: Color(_medicPrimaryValue),
//     600: Color(0xFFFCE5CD),
//     700: Color(0xFFFCE5CD),
//     800: Color(0xFFFCE5CD),
//     900: Color(0xFFFCE5CD),
//   },
// );
//
// static const int _papersPrimaryValue = 0xFFF4CCCC;
//
// static const MaterialColor papers = MaterialColor(
//   _papersPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFF4CCCC),
//     100: Color(0xFFF4CCCC),
//     200: Color(0xFFF4CCCC),
//     300: Color(0xFFF4CCCC),
//     400: Color(0xFFF4CCCC),
//     500: Color(_papersPrimaryValue),
//     600: Color(0xFFF4CCCC),
//     700: Color(0xFFF4CCCC),
//     800: Color(0xFFF4CCCC),
//     900: Color(0xFFF4CCCC),
//   },
// );
//
// static const int _nutritionPrimaryValue = 0xFFC9DBF8;
//
// static const MaterialColor nutrition = MaterialColor(
//   _nutritionPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFC9DBF8),
//     100: Color(0xFFC9DBF8),
//     200: Color(0xFFC9DBF8),
//     300: Color(0xFFC9DBF8),
//     400: Color(0xFFC9DBF8),
//     500: Color(_nutritionPrimaryValue),
//     600: Color(0xFFC9DBF8),
//     700: Color(0xFFC9DBF8),
//     800: Color(0xFFC9DBF8),
//     900: Color(0xFFC9DBF8),
//   },
// );
}
