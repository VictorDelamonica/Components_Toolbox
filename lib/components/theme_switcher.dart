// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.

import 'package:components_toolbox/components/auto_text.dart';
import 'package:components_toolbox/components/rounded_buttons.dart';
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

/// A widget that allows switching between light and dark themes.
///
/// The `ThemeSwitcher` widget provides a UI element to toggle between light and dark
/// themes. It supports different styles such as icons and switches.
class ThemeSwitcher extends StatefulWidget {
  /// The style of the theme switcher.
  final ThemeSwitcherStyle style;

  /// The icon to display for the light theme.
  final IconData? iconLight;

  /// The icon to display for the dark theme.
  final IconData? iconDark;

  /// The background color for the dark theme.
  final Color? darkColor;

  /// The background color for the light theme.
  final Color? lightColor;

  /// The icon color for the dark theme.
  final Color? darkIconColor;

  /// The icon color for the light theme.
  final Color? lightIconColor;

  /// The font size for the text in the switcher.
  final double? fontSize;

  /// The font weight for the text in the switcher.
  final FontWeight? fontWeight;

  /// Creates a [ThemeSwitcher] widget.
  ///
  /// The [style] parameter is required.
  const ThemeSwitcher({
    super.key,
    this.style = ThemeSwitcherStyle.icons,
    this.iconLight,
    this.iconDark,
    this.darkColor,
    this.lightColor,
    this.darkIconColor,
    this.lightIconColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    super.initState();
    _appDelegate.appearanceNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case ThemeSwitcherStyle.icons:
        return CircleButton(
          onPressed: () {
            _appDelegate.switchAppearance();
            setState(() {});
          },
          icon: _appDelegate.isLight()
              ? widget.iconLight ?? Icons.sunny
              : widget.iconDark ?? Icons.nightlight_round,
          color: _appDelegate.isLight() ? widget.lightColor : widget.darkColor,
          iconColor: _appDelegate.isLight()
              ? widget.lightIconColor
              : widget.darkIconColor,
        );
      case ThemeSwitcherStyle.switched:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoText(
              "Dark Mode",
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            Switch(
              value: !_appDelegate.isLight(),
              onChanged: (value) {
                _appDelegate.switchAppearance();
                setState(() {});
              },
              activeTrackColor:
                  widget.darkColor ?? _appDelegate.getColor("Dark"),
            ),
          ],
        );
    }
  }
}

/// Enum representing the style of the theme switcher.
enum ThemeSwitcherStyle { icons, switched }
