// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:components_toolbox/utils/shadows.dart';
import 'package:flutter/material.dart';

/// A widget that displays a rounded container with customizable properties.
class RoundedContainer extends StatefulWidget {
  /// The child widget to display inside the container.
  final Widget child;

  /// The height of the container.
  final double? height;

  /// The width of the container.
  final double? width;

  /// The border radius of the container.
  final double radius;

  /// The background color of the container.
  final Color? color;

  /// The padding inside the container.
  final double padding;

  /// The margin outside the container.
  final double margin;

  /// The shadow to apply to the container.
  final ValueNotifier<BoxShadow>? shadow;

  /// The border to apply to the container.
  final Border? border;

  /// Creates a `RoundedContainer` widget.
  ///
  /// The [child] parameter must not be null.
  const RoundedContainer({
    super.key,
    required this.child,
    this.radius = 16,
    this.padding = 8,
    this.margin = 0,
    this.height,
    this.width,
    this.color,
    this.shadow,
    this.border,
  });

  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  /// An instance of `AppDelegate` to manage app-wide settings.
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    super.initState();
    _appDelegate.appearanceNotifier.addListener(_updateShadows);
  }

  @override
  void dispose() {
    _appDelegate.appearanceNotifier.removeListener(_updateShadows);
    super.dispose();
  }

  /// Updates the shadows when the appearance changes.
  void _updateShadows() {
    CustomShadows.updateShadows();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BoxShadow>(
      valueListenable: widget.shadow ?? CustomShadows.regular,
      builder: (context, shadow, child) {
        return Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.all(widget.padding),
          margin: EdgeInsets.all(widget.margin),
          decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("Background"),
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: widget.shadow != null ? [shadow] : null,
            border: widget.border ?? Border.all(color: Colors.transparent),
          ),
          child: widget.child,
        );
      },
    );
  }
}
