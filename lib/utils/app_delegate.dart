import 'package:components_toolbox/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages the application's appearance settings and color schemes.
class AppDelegate {
  /// Notifies listeners of changes in the app's appearance.
  ValueNotifier<Appearance> appearanceNotifier =
      ValueNotifier<Appearance>(Appearance.light);

  ValueNotifier<CustomColors> colorNotifier = ValueNotifier<CustomColors>(
    CustomColors(),
  );

  /// A map of color schemes for different UI elements in light and dark modes.
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
      "dark": CustomColors.appBar,
    },
    "Light": {
      "light": CustomColors.light,
      "dark": CustomColors.lightDark,
    },
    "InvertedLight": {
      "light": CustomColors.lightDark,
      "dark": CustomColors.light,
    },
    "Text": {
      "light": Colors.black,
      "dark": Colors.white,
    },
    "InvertedText": {
      "light": Colors.white,
      "dark": Colors.black,
    },
    "Grey": {
      "light": CustomColors.grey,
      "dark": CustomColors.greyDark,
    },
  };

  /// Singleton instance of `AppDelegate`.
  static final AppDelegate _instance = AppDelegate._internal();

  /// Private constructor for singleton pattern.
  AppDelegate._internal() {
    colorNotifier.addListener(_updateColors);
    CustomColors.colorNotifier.addListener(() {
      colorNotifier.value = CustomColors();
    });
  }

  /// Returns the singleton instance of `AppDelegate`.
  ///
  /// \[collectionName\] is an optional parameter for future use.
  static AppDelegate getInstance({String? collectionName}) {
    return _instance;
  }

  /// Sets the appearance of the app and stores it in shared preferences.
  void setAppearance(Appearance appearance) {
    appearanceNotifier.value = appearance;
    storeAppearance();
  }

  /// Gets the current appearance of the app.
  Appearance getAppearance() {
    return appearanceNotifier.value;
  }

  /// Toggles the appearance between light and dark modes and stores it.
  void switchAppearance() {
    appearanceNotifier.value = appearanceNotifier.value == Appearance.light
        ? Appearance.dark
        : Appearance.light;
    storeAppearance();
  }

  /// Stores the current appearance setting in shared preferences.
  Future<void> storeAppearance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'appearance', appearanceNotifier.value.toString().split('.').last);
  }

  /// Checks if the current appearance is light mode.
  bool isLight() => appearanceNotifier.value == Appearance.light;

  /// Gets the color for a given color name based on the current appearance.
  Color getColor(String colorName) {
    return colors[colorName]![
        appearanceNotifier.value.toString().split('.').last];
  }

  /// Resets the appearance to light mode.
  void resetAppearance() {
    appearanceNotifier.value = Appearance.light;
  }

  /// Checks if the current appearance is dark mode.
  bool isDark() => appearanceNotifier.value == Appearance.dark;

  /// Sets the appearance based on the stored value in shared preferences.
  Future<void> setStoredAppearance() async {
    final prefs = await SharedPreferences.getInstance();
    appearanceNotifier.value = prefs.getString('appearance') == "dark"
        ? Appearance.dark
        : Appearance.light;
  }

  /// Updates the colors map when CustomColors changes.
  void _updateColors() {
    colors = {
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
        "dark": CustomColors.appBar,
      },
      "Light": {
        "light": CustomColors.light,
        "dark": CustomColors.lightDark,
      },
      "InvertedLight": {
        "light": CustomColors.lightDark,
        "dark": CustomColors.light,
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
    appearanceNotifier.value = appearanceNotifier.value;
    debugPrint("Colors updated");
  }
}

/// Enum representing the appearance modes.
enum Appearance { light, dark }
