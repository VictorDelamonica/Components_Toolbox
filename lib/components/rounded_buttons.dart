// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

/// A customizable rounded button widget with optional icon and shadow.
class RoundedButton extends StatefulWidget {
  /// The text to display on the button.
  final String text;

  /// The callback function to execute when the button is pressed.
  final Function onPressed;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The margin of the button.
  final double margin;

  /// The background color of the button.
  final Color? color;

  /// The color of the text on the button.
  final Color? textColor;

  /// The icon to display on the button.
  final IconData? icon;

  /// The size of the icon.
  final double? iconSize;

  /// The color of the icon.
  final Color? iconColor;

  /// The shadow to apply to the button.
  final ValueNotifier<BoxShadow>? shadow;

  /// Creates a `RoundedButton` widget.
  ///
  /// The [onPressed] parameter must not be null.
  /// The [text] parameter must not be empty if [icon] is null.
  const RoundedButton(
      {super.key,
      this.text = "",
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.textColor,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.shadow,
      this.margin = 0.0})
      : assert(text != "" || icon != null);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with SingleTickerProviderStateMixin {
  /// An instance of `AppDelegate` to manage app-wide settings.
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  /// The current color of the button's container.
  var containerColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
        height: widget.height ?? 48,
        margin: EdgeInsets.all(widget.margin),
        decoration: BoxDecoration(
          color: widget.color ?? _appDelegate.getColor("AppBar"),
          borderRadius: BorderRadius.circular(24),
          boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              widget.onPressed();
            },
            child: Center(
              child: AutoText(
                widget.text,
                textColor: widget.textColor ?? _appDelegate.getColor("Text"),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

/// A rounded button widget with an icon.
class RoundedButtonWithIcons extends RoundedButton {
  /// The icon to display on the button.
  @override
  final IconData icon;

  /// The size of the icon.
  @override
  final double iconSize;

  /// The color of the icon.
  @override
  final Color? iconColor;

  /// Creates a `RoundedButtonWithIcons` widget.
  ///
  /// The [icon] parameter must not be null.
  const RoundedButtonWithIcons(
    this.icon, {
    super.key,
    required super.text,
    required super.onPressed,
    super.width,
    super.height,
    super.color,
    super.textColor,
    this.iconSize = 24,
    this.iconColor,
    super.shadow,
  }) : super(icon: icon, iconSize: iconSize, iconColor: iconColor);

  @override
  State<RoundedButton> createState() => _RoundedButtonWithIconsState();
}

class _RoundedButtonWithIconsState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
      height: widget.height ?? 48,
      margin: EdgeInsets.all(widget.margin),
      decoration: BoxDecoration(
        color: widget.color ?? _appDelegate.getColor("AppBar"),
        borderRadius: BorderRadius.circular(24),
        boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.onPressed();
          },
          borderRadius: BorderRadius.circular(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 8),
              AutoText(
                widget.text,
              ),
              Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor ?? _appDelegate.getColor("Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// An outlined rounded button widget.
class OutlinedRoundedButton extends RoundedButton {
  /// Creates an `OutlinedRoundedButton` widget.
  ///
  /// The [text] and [onPressed] parameters must not be null.
  const OutlinedRoundedButton(
    String text, {
    super.key,
    required super.onPressed,
    super.width,
    super.height,
    super.color,
    super.textColor,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.shadow,
  }) : super(text: text);

  @override
  State<RoundedButton> createState() => _OutlinedRoundedButtonState();
}

class _OutlinedRoundedButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
      height: widget.height ?? 48,
      margin: EdgeInsets.all(widget.margin),
      decoration: BoxDecoration(
        color: _appDelegate.getColor("Background"),
        borderRadius: BorderRadius.circular(24),
        boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
        border: Border.all(
          color: widget.color ?? _appDelegate.getColor("Text"),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.onPressed();
          },
          borderRadius: BorderRadius.circular(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 8),
              AutoText(
                widget.text,
              ),
              Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor ?? _appDelegate.getColor("Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A circular button widget.
class CircleButton extends RoundedButton {
  /// Creates a `CircleButton` widget.
  ///
  /// The [onPressed] parameter must not be null.
  const CircleButton({
    super.key,
    super.text,
    required super.onPressed,
    super.width,
    super.height,
    super.color,
    super.textColor,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.shadow,
  });

  @override
  State<RoundedButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 48,
      height: widget.height ?? 48,
      margin: EdgeInsets.all(widget.margin),
      decoration: BoxDecoration(
        color: widget.color ?? _appDelegate.getColor("AppBar"),
        borderRadius: BorderRadius.circular(24),
        boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.onPressed();
          },
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor ?? _appDelegate.getColor("Text"),
            ),
          ),
        ),
      ),
    );
  }
}

/// A button widget with auto text adjustment.
class AutoTextButton extends RoundedButton {
  /// Creates an `AutoTextButton` widget.
  ///
  /// The [text] and [onPressed] parameters must not be null.
  const AutoTextButton(
    String text, {
    super.key,
    required super.onPressed,
    super.width,
    super.height,
    super.color,
    super.textColor,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.shadow,
  }) : super(text: text);

  @override
  State<RoundedButton> createState() => _AutoTextButtonState();
}

class _AutoTextButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.all(widget.margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.onPressed();
          },
          borderRadius: BorderRadius.circular(24),
          child: AutoText(
            widget.text,
            textColor:
                widget.textColor ?? _appDelegate.getColor("InvertedDark"),
          ),
        ),
      ),
    );
  }
}
