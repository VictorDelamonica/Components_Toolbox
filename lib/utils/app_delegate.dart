import 'package:components_toolbox/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDelegate {
  ValueNotifier<Appearance> appearanceNotifier =
      ValueNotifier<Appearance>(Appearance.light);

  Map<String, dynamic> colors = {
    "AppBar": {
      "light": CustomColors.appBar,
      "dark": CustomColors.appBarDark,
    },
    "Background": {
      "light": CustomColors.background,
      "dark": CustomColors.backgroundDark,
    },
    "Dark": {
      "light": CustomColors.dark,
      "dark": CustomColors.darkDark,
    },
    "InvertedDark": {
      "light": CustomColors.dark,
      "dark": CustomColors.light,
    },
    "Light": {
      "light": CustomColors.light,
      "dark": CustomColors.lightDark,
    },
    "Text": {
      "light": Colors.black,
      "dark": Colors.white,
    },
    "InvertedText": {
      "light": Colors.white,
      "dark": Colors.black,
    },
  };

  static final AppDelegate _instance = AppDelegate._internal();

  AppDelegate._internal();

  static AppDelegate getInstance({String? collectionName}) {
    return _instance;
  }

  void setAppearance(Appearance appearance) {
    appearanceNotifier.value = appearance;
    storeAppearance();
  }

  Appearance getAppearance() {
    return appearanceNotifier.value;
  }

  void switchAppearance() {
    appearanceNotifier.value = appearanceNotifier.value == Appearance.light
        ? Appearance.dark
        : Appearance.light;
    storeAppearance();
  }

  Future<void> storeAppearance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'appearance', appearanceNotifier.value.toString().split('.').last);
  }

  bool isLight() => appearanceNotifier.value == Appearance.light;

  Color getColor(String colorName) {
    return colors[colorName]![
        appearanceNotifier.value.toString().split('.').last];
  }

  void resetAppearance() {
    appearanceNotifier.value = Appearance.light;
  }

  bool isDark() => appearanceNotifier.value == Appearance.dark;

  Future<void> setStoredAppearance() async {
    final prefs = await SharedPreferences.getInstance();
    appearanceNotifier.value = prefs.getString('appearance') == "dark"
        ? Appearance.dark
        : Appearance.light;
  }
}

enum Appearance { light, dark }
