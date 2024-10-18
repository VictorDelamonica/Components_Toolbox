// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages the application's appearance settings and color schemes and popUp.
class AppDelegate {
  /// Notifies listeners of changes in the app's appearance.
  ValueNotifier<Appearance> appearanceNotifier =
      ValueNotifier<Appearance>(Appearance.light);

  /// Notifies listeners of changes in the app's of `CustomColors`.
  ValueNotifier<CustomColors> colorNotifier = ValueNotifier<CustomColors>(
    CustomColors(),
  );

  /// Notifies listeners of changes in the app's for the popUp
  ValueNotifier<List<Widget>> defaultPopUp = ValueNotifier([const SizedBox()]);

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
    appearanceNotifier.value = isLight() ? Appearance.dark : Appearance.light;
    storeAppearance();
    _updateColors();
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
    if (colors[colorName] == null) {
      throw ArgumentError(
          "Color name '$colorName' not found in colors map $colors");
    }
    return colors[colorName]![
        appearanceNotifier.value.toString().split('.').last];
  }

  /// Resets the appearance to light mode.
  void resetAppearance() {
    appearanceNotifier.value = Appearance.light;
  }

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
      "Grey": {
        "light": CustomColors.grey,
        "dark": CustomColors.greyDark,
      },
    };
    appearanceNotifier.value = appearanceNotifier.value;
    debugPrint("Colors updated");
  }

  /// Show a popUp from anywhere (with context) with the `defaultPopUp` (from the AppDelegate) or a custom (`child`)
  void showPopUp({
    required BuildContext context,
    EdgeInsetsGeometry? padding,
    Color? background,
    Widget? child,
    bool withActions = false,
    bool roundedButtons = false,
    Function? action1,
    Function? action2,
    String? text1,
    String? text2,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: background ?? getColor("Dark"),
            child: Padding(
                padding: padding ?? const EdgeInsets.all(16.0),
                child: withActions
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: defaultPopUp.value +
                            [
                              const SizedBox(
                                height: 16,
                              )
                            ] +
                            [
                              roundedButtons
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RoundedButton(
                                            text: text1 ?? "Cancel",
                                            onPressed: () {
                                              action1 ?? Navigator.pop(context);
                                            },
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3),
                                        RoundedButton(
                                            text: text2 ?? "Okay",
                                            onPressed: () {
                                              action1 ?? Navigator.pop(context);
                                            },
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AutoTextButton(text1 ?? "Cancel",
                                            onPressed: () {
                                          action1 ?? Navigator.pop(context);
                                        }),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        AutoTextButton(text2 ?? "Okay",
                                            onPressed: () {
                                          action1 ?? Navigator.pop(context);
                                        }),
                                      ],
                                    )
                            ],
                      )
                    : child ??
                        Column(
                          children: defaultPopUp.value,
                        )),
          );
        });
  }
}

/// Enum representing the appearance modes.
enum Appearance { light, dark }
