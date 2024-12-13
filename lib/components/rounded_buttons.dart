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

  /// The border color of the button.
  final Color? borderColor;

  /// The border width of the button.
  final double? borderWidth;

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

  /// The radius of the button.
  final double radius;

  /// The boolean value to check if the button is disabled.
  final bool isDisabled;

  /// A customizable rounded button widget with optional icon and shadow.
  ///
  /// The [onPressed] parameter must not be null.
  /// The [text] parameter must not be empty if [icon] is null.
  const RoundedButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.textColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.shadow,
    this.margin = 0.0,
    this.radius = 24,
    this.isDisabled = false,
  });

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
      RoundedContainer(
        width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
        height: widget.height ?? 48,
        margin: widget.margin,
        color: widget.isDisabled
            ? _appDelegate.getColor("Grey")
            : widget.color ?? _appDelegate.getColor("AppBar"),
        radius: widget.radius,
        shadow: widget.shadow,
        padding: 0.0,
        border: widget.borderColor != null
            ? Border.all(
                color: widget.borderColor!,
                width: widget.borderWidth ?? 1.0,
              )
            : null,
        child: Material(
          color: Colors.transparent,
          child: widget.isDisabled
              ? Center(
                  child: AutoText(
                    widget.text,
                    textColor: widget.textColor,
                  ),
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    if (widget.isDisabled) return;
                    widget.onPressed();
                  },
                  child: Center(
                    child: AutoText(
                      widget.text,
                      textColor: widget.textColor,
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
    super.borderColor,
    super.borderWidth,
    super.textColor,
    this.iconSize = 24,
    this.iconColor,
    super.shadow,
    super.margin,
    super.radius,
    super.isDisabled = false,
  }) : super(iconSize: iconSize, iconColor: iconColor);

  @override
  State<RoundedButton> createState() => _RoundedButtonWithIconsState();
}

class _RoundedButtonWithIconsState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
      height: widget.height ?? 48,
      margin: widget.margin,
      color: widget.isDisabled
          ? _appDelegate.getColor("Grey")
          : widget.color ?? _appDelegate.getColor("AppBar"),
      radius: widget.radius,
      shadow: widget.shadow,
      border: widget.borderColor != null
          ? Border.all(
              color: widget.borderColor!,
              width: widget.borderWidth ?? 1.0,
            )
          : null,
      padding: 0.0,
      child: Material(
        color: Colors.transparent,
        child: widget.isDisabled
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 8),
                  AutoText(
                    widget.text,
                    textColor: widget.textColor,
                  ),
                  Icon(
                    widget.icon,
                    size: widget.iconSize,
                    color: widget.iconColor ?? _appDelegate.getColor("Text"),
                  ),
                ],
              )
            : InkWell(
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
                      textColor: widget.textColor,
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
    super.borderColor,
    super.borderWidth,
    super.textColor,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.shadow,
    super.margin,
    super.radius,
    super.isDisabled = false,
  }) : super(text: text);

  @override
  State<RoundedButton> createState() => _OutlinedRoundedButtonState();
}

class _OutlinedRoundedButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
      height: widget.height ?? 48,
      margin: widget.margin,
      border: Border.all(
        color: widget.isDisabled
            ? _appDelegate.getColor("Grey")
            : widget.borderColor ?? _appDelegate.getColor("AppBar"),
        width: widget.borderWidth ?? 1.0,
      ),
      radius: widget.radius,
      shadow: widget.shadow,
      padding: 0.0,
      child: widget.isDisabled
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 8),
                AutoText(
                  widget.text,
                  textColor: widget.isDisabled
                      ? _appDelegate.getColor("Grey")
                      : widget.textColor,
                ),
                Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: widget.iconColor ?? _appDelegate.getColor("Text"),
                ),
              ],
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  widget.onPressed();
                },
                borderRadius: BorderRadius.circular(widget.radius),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 8),
                    AutoText(
                      widget.text,
                      textColor: widget.textColor,
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
    super.borderColor,
    super.borderWidth,
    super.textColor,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.shadow,
    super.margin,
    super.radius,
    super.isDisabled = false,
  });

  @override
  State<RoundedButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: widget.width ?? 48,
      height: widget.height ?? 48,
      margin: widget.margin,
      color: widget.isDisabled
          ? _appDelegate.getColor("Grey")
          : widget.color ?? _appDelegate.getColor("AppBar"),
      radius: widget.radius,
      shadow: widget.shadow,
      border: Border.all(
        color: widget.borderColor ?? _appDelegate.getColor("AppBar"),
        width: widget.borderWidth ?? 1.0,
      ),
      padding: 0.0,
      child: widget.isDisabled
          ? Center(
              child: Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor ?? _appDelegate.getColor("Text"),
              ),
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  widget.onPressed();
                },
                borderRadius: BorderRadius.circular(widget.radius),
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
    super.shadow,
    super.margin,
    super.radius,
    super.isDisabled = false,
  })  : assert(text != ""),
        super(text: text);

  @override
  State<RoundedButton> createState() => _AutoTextButtonState();
}

class _AutoTextButtonState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: widget.height ?? 24,
      width: widget.width,
      margin: widget.margin,
      radius: widget.radius,
      shadow: widget.shadow,
      padding: 0.0,
      color: widget.isDisabled
          ? Colors.transparent
          : widget.color ?? Colors.transparent,
      child: widget.isDisabled
          ? AutoText(
              widget.text,
              textColor: _appDelegate.getColor("Grey"),
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  widget.onPressed();
                },
                borderRadius: BorderRadius.circular(widget.radius),
                child: Center(
                  child: AutoText(
                    widget.text,
                    textColor: widget.textColor ??
                        _appDelegate.getColor("InvertedDark"),
                  ),
                ),
              ),
            ),
    );
  }
}
