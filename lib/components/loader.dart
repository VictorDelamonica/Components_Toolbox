// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'dart:async';

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget that displays a loading indicator with a fade transition to a page.
///
/// The [Loader] widget shows a loading indicator (either an icon, image, or
/// circular progress indicator) and transitions to the provided page with a
/// fade effect when the [value] changes.
class Loader extends StatefulWidget {
  /// A [ValueListenable] that controls the visibility of the loading indicator.
  final ValueListenable<bool> value;

  /// The page to display after the loading indicator.
  final Widget page;

  /// The color of the loading indicator.
  final Color? color;

  /// The duration of the fade transition in milliseconds.
  final int milliseconds;

  /// The curve of the fade transition animation.
  final Curve curve;

  /// The icon to display as the loading indicator.
  final IconData? icon;

  /// The size of the icon.
  final double? iconSize;

  /// The path to the image to display as the loading indicator.
  final String? imagePath;

  /// The size of the image.
  final double? imageSize;

  /// A widget that displays a loading indicator with a fade transition to a page.
  ///
  /// The [Loader] widget shows a loading indicator (either an icon, image, or
  /// circular progress indicator) and transitions to the provided page with a
  /// fade effect when the [value] changes.
  ///
  /// The [value] and [page] parameters are required and must not be `null`.
  const Loader({
    super.key,
    required this.value,
    required this.page,
    this.color,
    this.milliseconds = 500,
    this.curve = Curves.easeInOut,
    this.icon,
    this.iconSize,
    this.imagePath,
    this.imageSize = 60,
  });

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  /// The animation controller for the fade transition.
  late AnimationController _controller;

  /// The animation for the fade transition.
  late Animation<double> _animation;

  /// The animation controller for the rotation animation.
  late AnimationController _rotationController;

  /// The animation for the rotation.
  late Animation<double> _rotationAnimation;

  /// The height of the image.
  late double _height = 200.0;

  /// The width of the image.
  late double _width = 200.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.milliseconds),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _rotationAnimation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    );
    if (widget.imagePath != null) {
      _height = widget.imageSize!;
      _width = widget.imageSize!;
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        if (mounted) {
          setState(() {
            _height = _height == widget.imageSize
                ? widget.imageSize! * 1.2
                : widget.imageSize!;
            _width = _width == widget.imageSize
                ? widget.imageSize! * 1.2
                : widget.imageSize!;
          });
        } else {
          timer.cancel();
        }
      });
    }
    widget.value.addListener(_handleValueChange);
  }

  /// Handles changes to the [value] and updates the animation.
  void _handleValueChange() {
    if (widget.value.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _rotationController.dispose();
    widget.value.removeListener(_handleValueChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _animation,
          child: widget.page,
        ),
        FadeTransition(
          opacity: ReverseAnimation(_animation),
          child: Center(
            child: widget.icon != null
                ? RotationTransition(
                    turns: _rotationAnimation,
                    child: Icon(widget.icon,
                        size: widget.iconSize ?? 60,
                        color: widget.color ??
                            AppDelegate.getInstance().getColor("Dark")),
                  )
                : widget.imagePath != null
                    ? AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: _height,
                        width: _width,
                        child: Image.asset(
                          widget.imagePath!,
                          width: widget.imageSize,
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            widget.color ??
                                AppDelegate.getInstance().getColor("Dark")),
                      ),
          ),
        ),
      ],
    );
  }
}
