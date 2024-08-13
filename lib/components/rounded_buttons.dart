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
      this.shadow})
      : assert(text != "" || icon != null);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with SingleTickerProviderStateMixin {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  late AnimationController _controller;
  late Animation<double> _animation;
  var containerColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {
          containerColor = _appDelegate
              .getColor("InvertedDark")
              .withOpacity(_animation.value);
        });
      });
    _animation = Tween<double>(begin: 0.0, end: 0.4).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      onLongPress: () {
        _controller.forward();
      },
      onLongPressEnd: (details) {
        _controller.reverse();
      },
      child: Stack(children: [
        Container(
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
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(24),
          ),
        )
      ]),
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
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      onLongPress: () {
        _controller.forward();
      },
      onLongPressEnd: (details) {
        _controller.reverse();
      },
      child: Stack(children: [
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("AppBar"),
            borderRadius: BorderRadius.circular(24),
            boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
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
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(24),
          ),
        )
      ]),
    );
  }
}

class OutlinedRoundedButton extends RoundedButton {
  const OutlinedRoundedButton(
    String text, {
    Key? key,
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
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      onLongPress: () {
        _controller.forward();
      },
      onLongPressEnd: (details) {
        _controller.reverse();
      },
      child: Stack(children: [
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: _appDelegate.getColor("Background"),
            borderRadius: BorderRadius.circular(24),
            boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
            border: Border.all(
              color: widget.color ?? _appDelegate.getColor("Text"),
            ),
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
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width - 16 * 2,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(24),
          ),
        )
      ]),
    );
  }
}

class CircleButton extends RoundedButton {
  const CircleButton({
    super.text,
    Key? key,
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
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      onLongPress: () {
        _controller.forward();
      },
      onLongPressEnd: (details) {
        _controller.reverse();
      },
      child: Stack(children: [
        Container(
          width: widget.width ?? 48,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("AppBar"),
            borderRadius: BorderRadius.circular(24),
            boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor ?? _appDelegate.getColor("Text"),
            ),
          ),
        ),
        Container(
          width: widget.width ?? 48,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(24),
          ),
        )
      ]),
    );
  }
}

class AutoTextButton extends RoundedButton {
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
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      onLongPress: () {
        _controller.forward();
      },
      onLongPressEnd: (details) {
        _controller.reverse();
      },
      child: Stack(
        children: [
          Container(
            height: widget.height ?? 24,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: widget.shadow != null ? [widget.shadow!.value] : [],
            ),
            child: AutoText(
              widget.text,
              textColor:
                  widget.textColor ?? _appDelegate.getColor("InvertedDark"),
            ),
          ),
          Container(
            height: widget.height ?? 24,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
