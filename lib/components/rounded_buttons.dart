// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final ValueNotifier<BoxShadow>? shadow;

  const RoundedButton(this.text,
      {super.key,
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.textColor,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.shadow});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
        height: widget.height ?? 48,
        decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("AppBar"),
            borderRadius: BorderRadius.circular(24),
            boxShadow: widget.shadow != null ? [widget.shadow!.value] : []),
        child: Center(
          child: AutoText(
            widget.text,
          ),
        ),
      ),
    );
  }
}

class RoundedButtonWithIcons extends RoundedButton {
  final IconData icon;
  final double iconSize;
  final Color? iconColor;

  const RoundedButtonWithIcons(
    this.icon, {
    Key? key,
    required String text,
    required Function onPressed,
    double? width,
    double? height,
    Color? color,
    Color? textColor,
    this.iconSize = 24,
    this.iconColor,
  }) : super(text,
            onPressed: onPressed,
            width: width,
            height: height,
            color: color,
            textColor: textColor,
            icon: icon,
            iconSize: iconSize,
            iconColor: iconColor);

  @override
  State<RoundedButton> createState() => _RoundedButtonWithIconsState();
}

class _RoundedButtonWithIconsState extends _RoundedButtonState {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
        height: widget.height ?? 48,
        decoration: BoxDecoration(
          color: widget.color ?? _appDelegate.getColor("AppBar"),
          borderRadius: BorderRadius.circular(24),
        ),
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
    );
  }
}

class OutlinedRoundedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final ValueNotifier<BoxShadow>? shadow;

  const OutlinedRoundedButton(this.text,
      {super.key,
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.textColor,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.shadow});

  @override
  State<OutlinedRoundedButton> createState() => _OutlinedRoundedButtonState();
}

class _OutlinedRoundedButtonState extends State<OutlinedRoundedButton> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();
  late Color containerColor;
  late Color textColor;

  @override
  void initState() {
    super.initState();
    containerColor = widget.color ?? _appDelegate.getColor("Background");
    textColor = widget.textColor ?? _appDelegate.getColor("Text");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
        height: widget.height ?? 48,
        decoration: BoxDecoration(
            color: _appDelegate.getColor("Background"),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _appDelegate.getColor("Text"),
            ),
            boxShadow: widget.shadow != null
                ? [widget.shadow!.value]
                : [CustomShadows.bigCentered.value]),
        child: Center(
          child: AutoText(
            widget.text,
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  final IconData icon;
  final Function onPressed;
  final double size;
  final Color? color;
  final Color? iconColor;
  final ValueNotifier<BoxShadow>? shadow;

  const CircleButton(this.icon,
      {super.key,
      required this.onPressed,
      this.size = 48,
      this.color,
      this.iconColor,
      this.shadow});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("AppBar"),
            shape: BoxShape.circle,
            boxShadow: widget.shadow != null ? [widget.shadow!.value] : []),
        child: Center(
          child: Icon(
            widget.icon,
            color: widget.iconColor ?? _appDelegate.getColor("Text"),
          ),
        ),
      ),
    );
  }
}
