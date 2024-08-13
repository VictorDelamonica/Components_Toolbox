// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'package:flutter/material.dart';

/// Enum representing custom color options.
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

/// A class that defines custom colors used in the application.
class CustomColors {
  /// Color for the app bar in light mode.
  static Color appBar = const Color.fromRGBO(211, 233, 231, 1);

  /// Color for the background in light mode.
  static Color background = const Color.fromRGBO(244, 246, 245, 1);

  /// Color for dark elements in light mode.
  static Color dark = const Color.fromRGBO(46, 125, 132, 1);

  /// Color for light elements in light mode.
  static Color light = const Color.fromRGBO(255, 255, 255, 1);

  /// Color for the app bar in dark mode.
  static Color appBarDark = const Color.fromRGBO(68, 136, 130, 1);

  /// Color for the background in dark mode.
  static Color backgroundDark = const Color.fromRGBO(51, 51, 51, 1);

  /// Color for dark elements in dark mode.
  static Color darkDark = const Color.fromRGBO(33, 90, 95, 1);

  /// Color for light elements in dark mode.
  static Color lightDark = const Color.fromRGBO(61, 61, 61, 1.0);

  /// Sets the color for a given custom color type.
  ///
  /// [customColor] The type of custom color to set.
  /// [color] The color to set for the given custom color type.
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
}
